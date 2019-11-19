#springboot部署
FROM registry.cn-hangzhou.aliyuncs.com/zhuwenshen/jdk:1.8.1

RUN mkdir /jar
ADD *.jar /jar
ENV JAVA_OPTS=""
CMD java -jar ${JAVA_OPTS} /jar/*.jar

#bulid
#docker build -t registry.cn-hangzhou.aliyuncs.com/zhuwenshen/myspringboot:2.1.8 .
#启动命令
#docker run --rm --name myspringboot -p 8080:8080 -e JAVA_OPTS="-Xms4g -Xmx4g"  registry.cn-hangzhou.aliyuncs.com/zhuwenshen/myspringboot:2.1.8