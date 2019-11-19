#springboot部署
FROM registry.cn-hangzhou.aliyuncs.com/zhuwenshen/myspringboot:2.1.8

ADD skywalking-agent.tar.gz /
# ENV JAVA_OPTS=""
# 被代理服务名
ENV SERVICE_NAME=app_with_skywalking
# 代理服务器地址
ENV BACKEND_SERVICE=127.0.0.1:11800

CMD java -javaagent:/skywalking-agent/skywalking-agent.jar -Dskywalking.agent.service_name=${SERVICE_NAME} -Dskywalking.collector.backend_service=${BACKEND_SERVICE} -jar  ${JAVA_OPTS} /jar/*.jar

#bulid
#docker build -t registry.cn-hangzhou.aliyuncs.com/zhuwenshen/skywalking-agent:1.6.5.0 .
#启动命令
#docker run --rm --name skywalking-agent -p 8080:8080 -e JAVA_OPTS="-Xms4g -Xmx4g" -e SERVICE_NAME=abc -e BACKEND_SERVICE=127.0.0.1:11800 registry.cn-hangzhou.aliyuncs.com/zhuwenshen/skywalking-agent:1.6.5.0