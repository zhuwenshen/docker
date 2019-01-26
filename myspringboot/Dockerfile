#springboot部署
FROM registry.cn-hangzhou.aliyuncs.com/zhuwenshen/jdk:1.8
#VOLUME /tmp
#设置编码
#ENV LANG en_US.UTF-8
#设置时区
#RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
#	&&  echo "Asia/Shanghai" > /etc/timezone; 

RUN mkdir /jar
ADD *.jar /jar
ENV JAVA_OPTS=""
ENTRYPOINT java -jar /jar/*.jar
#EXPOSE 8080
#CMD /bin/bash