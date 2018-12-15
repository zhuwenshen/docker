FROM centos:7
MAINTAINER zhuwenshen<1204621904@qq.com>
# Default to UTF-8 file.encoding
ENV LANG C.UTF-8
#修改时区
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN echo 'Asia/Shanghai' >/etc/timezone
#定义变量
#jdk-8u191-linux-x64.tar.gz
ENV JDKNAME jdk1.8.0_191
ENV TOMCAT_NAME tomcat

ADD apache-tomcat-7.0.55.tar.gz /
RUN mv /apache-tomcat-7.0.55 /tomcat


#复制内容
ADD jdk-8u191-linux-x64.tar.gz /usr/lib

#设置环境变量
#ENV JAVA_VERSION 1.8.0_191
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
#docker run -d --name tomcat7 -p 8080:8080 -v /dockerdata/tomcat7/logs:/tomcat/logs tomact:7

