# JDK1.8.1
FROM alpine:3.10.3
# 作者
MAINTAINER by zhuwenshen<1204621904@qq.com>
# 设置编码
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

#使用阿里镜像
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories

# 设置时区
ENV  TZ='Asia/Shanghai'  
RUN apk --no-cache add tzdata \
	&& ln -sf /usr/share/zoneinfo/$TZ /etc/localtime \  
	&& echo $TZ > /etc/timezone 

WORKDIR /

# 添加glibc依赖
COPY glibc-2.29-r0.apk /
RUN apk --no-cache add ca-certificates \
	&& wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub \
	&& apk --no-cache add glibc-2.29-r0.apk \
	&& rm -rf /glibc-2.29-r0.apk 

ENV JDKNAME=jdk1.8.0_231
ADD jdk-8u231-linux-x64.tar.gz /usr/lib
ENV JAVA_HOME /usr/lib/$JDKNAME
ENV PATH $PATH:$JAVA_HOME/bin

CMD /bin/sh

# build
# docker build -t jdk:1.8.1 .

