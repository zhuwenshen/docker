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

WORKDIR /app

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD [ "python", "./server.py" ]

#build
#docker build -t python_app:1.0 .
#run
#docker run --name python_app -p 81:80 -v /home/dockerdata/python_app/data:/app registry.cn-hangzhou.aliyuncs.com/zhuwenshen/python_app:1.0
#docker run --name python_app -p 81:80 -v /home/dockerdata/python_app/data:/app  python_app:1.0
#docker run --rm --name python_app -p 81:80 python_app:1.0