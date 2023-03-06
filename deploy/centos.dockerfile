#构建带有java8环境的centos7
FROM centos:7
MAINTAINER guohc
ENV MYPATH /usr/local/java
WORKDIR $MYPATH
RUN mkdir /usr/local/java
ADD jdk-8u331-linux-x64.tar.gz /usr/local/java
# 配置JAVA_HOME环境变量
ENV JAVA_HOME /usr/local/java/jdk1.8.0_331
# 将JAVA_HOME/bin 添加至PATH环境变量
ENV PATH $PATH:$JAVA_HOME/bin