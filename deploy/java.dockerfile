FROM mycentos:1.0
MAINTAINER guohc
COPY ./ghc.jar /tmp/ghc.jar
EXPOSE 8080
ENTRYPOINT java -jar /tmp/ghc.jar
