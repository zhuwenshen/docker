FROM python:3.7.4-buster
MAINTAINER zhuwenshen<1204621904@qq.com>

#时区
ENV  TZ='Asia/Shanghai'  
RUN ln -sf /usr/share/zoneinfo/$TZ /etc/localtime \  
	&& echo $TZ > /etc/timezone

#pip源
ENV PIP_CONF='/etc/pip.conf'
RUN touch $PIP_CONF \
	&& chmod 755 $PIP_CONF \
	&& echo '[global]' >> $PIP_CONF \
	&& echo 'trusted-host=mirrors.aliyun.com' >> $PIP_CONF \
	&& echo 'index-url=https://mirrors.aliyun.com/pypi/simple' >> $PIP_CONF	

#pip安装相关包
RUN pip install jupyter numpy tensorflow matplotlib

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
#docker build -t jupyter:1.1 .
#run
#docker run --name jupyter -p 6006:6006 -v /home/docketdata/jupyter/data:/app/data -e PASSWD='123'  registry.cn-hangzhou.aliyuncs.com/zhuwenshen/jupyter:1.1
#docker run --name jupyter -p 6006:6006 -v /home/docketdata/jupyter/data:/app/data  jupyter:1.1
#docker run --rm --name jupyter -p 6006:6006 jupyter:1.1