FROM ubuntu
RUN apt-get update
RUN apt-get install -y default-jre
RUN apt-get install -y wget curl
#RUN wget https://dlcdn.apache.org/kafka/3.7.2/kafka-3.7.2-src.tgz
RUN wget https://dlcdn.apache.org/kafka/3.7.2/kafka_2.12-3.7.2.tgz
RUN tar -xvf kafka_2.12-3.7.2.tgz
ADD run.sh ./
ADD zookeeper.properties ./
ADD server.properties ./

RUN chmod +x run.sh
#RUN ./kafka-3.7.2-src/gradlew jar -PscalaVersion=2.13.12 
EXPOSE 2181 9092

CMD ["bash", "./run.sh"]
