FROM quay.io/centos/centos:stream8

ENV TZ="America/Sao_Paulo"

RUN curl -fsSL https://rpm.nodesource.com/setup_16.x | bash -

RUN dnf -y update &&\
 dnf -y install epel-release &&\
 dnf -y install git nodejs gcc-c++ make &&\
 dnf clean all

RUN git clone https://github.com/letscodebyada/desafio-devops.git /root/desafio-devops &&\
 cd /root/desafio-devops/frontend/app &&\
 sed 's/localhost/apibackend/g' -i src/environments/environment.ts &&\
 npm install &&\
 npm install -g @angular/cli@latest &&\
 rm -rf /root/desafio-devops/backend /root/desafio-devops/README.md

WORKDIR /root/desafio-devops/frontend/app/src
RUN ng analytics off

CMD ["ng","serve"]
