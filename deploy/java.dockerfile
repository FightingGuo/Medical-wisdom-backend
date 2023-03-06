FROM mycentos:1.0
MAINTAINER guohc
COPY ./ruoyi.jar /tmp/ruoyi.jar
EXPOSE 8080
ENTRYPOINT java -jar /tmp/ruoyi.jar
