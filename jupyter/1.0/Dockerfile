FROM python:3.7.4-alpine3.10
MAINTAINER zhuwenshen<1204621904@qq.com>

USER root

#apk源
RUN echo 'https://mirrors.aliyun.com/alpine/v3.10/main' > /etc/apk/repositories \
	&& echo 'https://mirrors.aliyun.com/alpine/v3.10/community' >> /etc/apk/repositories

#时区
ENV  TZ='Asia/Shanghai'  
RUN apk --no-cache add tzdata \
	&& ln -sf /usr/share/zoneinfo/$TZ /etc/localtime \  
	&& echo $TZ > /etc/timezone

#pip源
ENV PIP_CONF='/etc/pip.conf'
RUN touch $PIP_CONF \
	&& chmod 755 $PIP_CONF \
	&& echo '[global]' >> $PIP_CONF \
	&& echo 'trusted-host=mirrors.aliyun.com' >> $PIP_CONF \
	&& echo 'index-url=https://mirrors.aliyun.com/pypi/simple' >> $PIP_CONF
	
#apk安装相关包
RUN apk add g++ gcc linux-headers zeromq-dev freetype-dev

#pip安装相关包
RUN pip install jupyter numpy tensorflow-cpu matplotlib

#生成配置文件和密码
ENV PASSWD='123456'
RUN jupyter notebook -y --generate-config \
	&& PASSWD=$(python -c 'from notebook.auth import passwd;import os; print(passwd(os.popen("echo -n $PASSWD").read()))')\
	&& echo "c.NotebookApp.password=u'${PASSWD}'" > ~/.jupyter/jupyter_notebook_config.py\
	&& PASSWD=''
	
RUN mkdir -p /app/data
EXPOSE 6006

WORKDIR /
ADD entrypoint.sh /
RUN chmod 777 /entrypoint.sh

CMD sh /entrypoint.sh
#ENTRYPOINT ["./entrypoint.sh"]
#CMD jupyter notebook --allow-root --no-browser --ip='0.0.0.0' --port=6006 --notebook-dir=/app/data 

#build
#docker build -t jupyter:1.0 .
#run
#docker run --name jupyter -p 6006:6006 -v /home/docketdata/jupyter/data:/app/data -e PASSWD='123'  jupyter:1.0
#docker run --name jupyter -p 6006:6006 -v /home/docketdata/jupyter/data:/app/data  jupyter:1.0