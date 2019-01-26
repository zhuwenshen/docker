#jdk8tomcat7.0.55
FROM centos:7
#作者
MAINTAINER zhuwenshen<1204621904@qq.com>
#设置编码
ENV LANG en_US.UTF-8
#设置时区
RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
	&&  echo "Asia/Shanghai" > /etc/timezone; 

ENV JDKNAME=jdk1.8.0_201
ENV TOMCAT_NAME tomcat
ADD jdk-8u201-linux-x64.tar.gz /usr/lib
ADD apache-tomcat-7.0.55.tar.gz /
RUN mv /apache-tomcat-7.0.55 /tomcat

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

#bulid
#docker build -t tomact:7 .
#启动命令
#docker run -d --name tomcat7 -p 8080:8080 -v /dockerdata/tomcat7/logs:/tomcat/logs -v /dockerdata/tomcat7/webapps:/tomcat/webapps -v /dockerdata/tomcat7/home:/tomcat/home tomact:7