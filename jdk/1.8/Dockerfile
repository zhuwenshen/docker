#JDK1.8
FROM centos:7
#作者
MAINTAINER by zhuwenshen<1204621904@qq.com>
#设置编码
ENV LANG en_US.UTF-8
#设置时区
RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
	&&  echo "Asia/Shanghai" > /etc/timezone; 

ENV JDKNAME=jdk1.8.0_201
ADD jdk-8u201-linux-x64.tar.gz /usr/lib
ENV JAVA_HOME /usr/lib/$JDKNAME
ENV PATH $PATH:$JAVA_HOME/bin

CMD /bin/bash

