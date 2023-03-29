#构建带有java8环境的centos7
FROM centos:7
MAINTAINER guohc
ENV MYPATH /usr/local/java
WORKDIR $MYPATH
RUN mkdir -p /usr/local/java
RUN yum install iputils
ADD jdk-8u161-linux-x64.tar.gz /usr/local/java
# 配置JAVA_HOME环境变量
ENV JAVA_HOME /usr/local/java/jdk1.8.0_161
# 将JAVA_HOME/bin 添加至PATH环境变量
ENV PATH $PATH:$JAVA_HOME/bin