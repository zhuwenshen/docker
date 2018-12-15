FROM centos:7
MAINTAINER zhuwenshen<1204621904@qq.com>
# Default to UTF-8 file.encoding
ENV LANG C.UTF-8
#定义变量
ENV JDKNAME jdk1.6.0_45
ENV TOMCAT_NAME tomcat

ADD apache-tomcat-6.0.53.tar.gz /
RUN mv /apache-tomcat-6.0.53 /tomcat


#复制内容
ADD jdk-6u45-linux-x64.bin /usr/lib

RUN cd /usr/lib \
	&& chmod u+x jdk-6u45-linux-x64.bin \
	&& ./jdk-6u45-linux-x64.bin \
	&& rm -f jdk-6u45-linux-x64.bin  

#设置环境变量
#ENV JAVA_VERSION 1.6.0_45
ENV JAVA_HOME /usr/lib/$JDKNAME
ENV CATALINA_HOME /tomcat
ENV PATH $PATH:$JAVA_HOME/bin:$CATALINA_HOME/bin

#落脚点
WORKDIR /tomcat
#暴露到主机上
#VOLUME ["/tomcat"]

#开启内部服务端口
EXPOSE 8080

#启动tomcat服务器
CMD /tomcat/bin/startup.sh && tail -f /tomcat/logs/catalina.out 

#启动命令
#docker run -d --name tomcat6 -p 8080:8080 -v /docker/volums/tomcat6 tomact:6

