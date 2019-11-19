#springboot部署
FROM registry.cn-hangzhou.aliyuncs.com/zhuwenshen/myspringboot:2.1.8

RUN rm -rf /jar/*
ADD *.jar /jar
ENV JAVA_OPTS=""
# 服务端口
ENV SERVER_PORT=8080
# 服务器地址
ENV DASHBOARD_SERVER=127.0.0.1:8080
# 项目名称
ENV PROJECT_NAME=sentinel-dashboard
# 是否鉴权(好像没用)
ENV AUTH_ENABLED=true
# 登录用户名
ENV SENTINEL_DASHBOARD_AUTH_USERNAME=sentinel
# 登录密码
ENV SENTINEL_DASHBOARD_AUTH_PASSWORD=sentinel

CMD java -Dserver.port=${SERVER_PORT} -Dcsp.sentinel.dashboard.server=${DASHBOARD_SERVER} -Dproject.name=${PROJECT_NAME} -Dauth.enabled=${AUTH_ENABLED} -Dsentinel.dashboard.auth.username=${SENTINEL_DASHBOARD_AUTH_USERNAME} -Dsentinel.dashboard.auth.password=${SENTINEL_DASHBOARD_AUTH_PASSWORD} -jar ${JAVA_OPTS} /jar/*.jar

#bulid
#docker build -t registry.cn-hangzhou.aliyuncs.com/zhuwenshen/sentinel:1.1.6.3 .
#启动命令
#docker run --rm --name sentinel -p 8080:8080 -e JAVA_OPTS="-Xms4g -Xmx4g" -e SENTINEL_DASHBOARD_AUTH_USERNAME=abc -e SENTINEL_DASHBOARD_AUTH_PASSWORD=abc registry.cn-hangzhou.aliyuncs.com/zhuwenshen/sentinel:1.1.6.3