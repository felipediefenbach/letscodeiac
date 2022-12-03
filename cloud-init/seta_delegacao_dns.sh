#!/bin/bash

AWS_ID_ZONA_DELEGADA="${1}"
PERFIL_ORIGEM="${4}"

# resgata os registros dns da zona recem criada
SERVIDOR_LISTADO=$(aws \
  --profile "${PERFIL_ORIGEM}"\
  route53 list-resource-record-sets \
  --hosted-zone-id "${AWS_ID_ZONA_DELEGADA}" \
  --query "ResourceRecordSets[?Type == 'NS']" | jq .[].ResourceRecords | jq .[].Value | tr -d '"' | paste -s -d ' ')

for SERVIDOR in ${SERVIDOR_LISTADO}; do
    SERVIDOR_AUTORITATIVO+=("{\"Value\":\"$SERVIDOR\"},")
done

AWS_PRD_ID_ZONA="${2}"
DOMINIO="${3}"
PERFIL_DESTINO="${4}"

# Aplica os registros NS na zona Materna
aws --profile "${PERFIL_DESTINO}" route53 change-resource-record-sets --hosted-zone-id "${AWS_PRD_ID_ZONA}" \
--change-batch '
  {
    "Comment": "atualiza a delegacao de zona"
    ,"Changes": [{
      "Action"              : "UPSERT"
      ,"ResourceRecordSet"  : {
        "Name"              : "'"${DOMINIO}"'"
        ,"Type"             : "NS"
        ,"TTL"              : 172800
        ,"ResourceRecords"  : ['"$(echo "${SERVIDOR_AUTORITATIVO[*]}" | tr -d '[:blank:]' | sed 's/.$//')"']
      }
    }]
  }
  '
