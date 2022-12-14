### Desafio 00: Criação de infraestrutura base

 - RedeMaterna(supernet) => Classe B para maior viabilidade de expansão
   futura.
 - SubRedes(subrede) => Usado intervalo de 14 host pois este é o
   menor número de hosts permitidos nas subredes da VPC da AWS.
   
# Como Usar:

1. Obrigatório o uso de um domínio Materno na AWS com Route53 pois o ambiente prove um sub-domínio para o seu deploy
2. Crie um IAM (administradora na AWS) e configure o AwsCli com as credenciais obtidas para role.
3. Instalar ansible e terraform localmente.
4. Ajuste as credenciais no: terraform.tfvars

		// Ambiente
		datacenterCorrente = "us-east-1" <- Região AWS
		terraformPerfil = "conexinfra" <- Perfil

		// Dns
		publicoComBr = "homolog.conexaoinfraestrutura.inf.br" <- sub-dominio + domínio da zona materna
		idZonaMaternaComBr = "Z02989652E5N1GM1F7LD1" <- ID da zona materna

5. Ajuste o sub-domínio no: dothehand.yml

		# - Projeto
		dominio: 'homolog.conexaoinfraestrutura.inf.br'

6. Execute o deploy

		ansible-playbook dothehand.yml --tags criar

7. Remova o deploy

		ansible-playbook dothehand.yml --tags destruir

Testado em:

	Fedora: 37
	Ansible: ansible-7.0.0 ansible-core-2.14
	Terrafron: terraform-1.3.5
	AwsCli: awscli-1.27.4
	(instalação, dnf install -y ...like...)
