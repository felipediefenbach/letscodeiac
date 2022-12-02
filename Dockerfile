FROM quay.io/centos/centos:stream8

ENV TZ="America/Sao_Paulo"
ENV MYSQL_DB_HOST=""
ENV MYSQL_DB_USER=""
ENV MYSQL_DB_PASS=""

RUN dnf -y update &&\
 dnf -y install epel-release &&\
 dnf -y install git maven java-11-openjdk-devel java-11-openjdk-headless java-11-openjdk &&\
 dnf clean all

RUN git clone https://github.com/letscodebyada/desafio-devops.git /root/desafio-devops &&\
 VERSAO=$(rpm -qa | grep java-11-openjdk | grep -v headless | grep -v devel) &&\
 alternatives --set java /usr/lib/jvm/${VERSAO}/bin/java &&\
 export JAVA_HOME=/usr/lib/jvm/${VERSAO} &&\
 cd /root/desafio-devops/backend/app &&\
 mvn clean package &&\
 mv target/*SNAPSHOT.jar /root/backend.jar &&\
 mv src/main/resources/application.yml src/main/resources/messages.properties /root/ &&\
 rm -rf /root/desafio-devops

CMD ["java","-jar","backend.jar"]
