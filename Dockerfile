FROM ubuntu:latest
RUN apt-get update
RUN apt-get install -y openjdk-8-jdk wget maven
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64
RUN wget http://apache.rediris.es/kafka/1.1.0/kafka_2.11-1.1.0.tgz
RUN tar -xzf kafka_2.11-1.1.0.tgz

# Descargar e instalar HSQLDB
RUN wget http://downloads.sourceforge.net/project/hsqldb/hsqldb/hsqldb_2_3/hsqldb-2.3.0.zip && \
    unzip hsqldb-2.3.0.zip && \
    mkdir -p /etc/hsqldb && \
    cp hsqldb-2.3.0/hsqldb/lib/hsqldb.jar /etc/hsqldb/

# puerto HSQLDB
EXPOSE 9001

ADD ./ ./project/
ADD ./run.sh .
RUN chmod +x run.sh
EXPOSE 8090
RUN cd /project && mvn package -DskipTests
CMD ./run.sh