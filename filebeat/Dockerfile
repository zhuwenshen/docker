#filebeat 6.6.2
FROM centos:7
#作者
MAINTAINER by zhuwenshen<1204621904@qq.com>
#设置编码
ENV LANG en_US.UTF-8
#设置时区
RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
	&&  echo "Asia/Shanghai" > /etc/timezone; 

ENV FILEBEAT_HOME=/filebeat
ADD filebeat-6.6.2-linux-x86_64.tar.gz /
RUN mv filebeat-6.6.2-linux-x86_64 $FILEBEAT_HOME
ADD filebeat.yml $FILEBEAT_HOME
RUN chown root $FILEBEAT_HOME/filebeat.yml
ENV PATH $PATH:$FILEBEAT_HOME

#落脚点
WORKDIR $FILEBEAT_HOME

#ENTRYPOINT ./filebeat -e
CMD cd $FILEBEAT_HOME && ./filebeat -e

#bulid
#docker build -t filebeat:6.6.2 .
#启动命令
#docker run --rm --name filebeat -v /var/run/docker.sock:/var/run/docker.sock -v /var/lib/docker/containers:/var/lib/docker/containers -v /dockerdata/filebeat/filebeat.yml:/filebeat/filebeat.yml filebeat:6.6.2
#docker run -d --name filebeat -v /var/run/docker.sock:/var/run/docker.sock -v /var/lib/docker/containers:/var/lib/docker/containers -v /dockerdata/filebeat/filebeat.yml:/filebeat/filebeat.yml filebeat:6.6.2