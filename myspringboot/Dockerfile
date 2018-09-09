#springboot部署
FROM registry.cn-hangzhou.aliyuncs.com/zhuwenshen/jdk:1.8
#VOLUME /tmp
#设置编码
ENV LANG C.UTF-8
#设置时区
RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
	&&  echo "Asia/Shanghai" > /etc/timezone; 
#RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN mkdir /jar
ADD app.jar /jar
#RUN bash -c ‘touch /jar/app.jar’
ENV JAVA_OPTS=""
ENTRYPOINT ["java","-jar","/jar/app.jar"]
#EXPOSE 8080
#CMD /bin/bash
