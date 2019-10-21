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

# 日志缓存为1，即实时日志
ENV PYTHONUNBUFFERED=1

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD [ "python", "./server.py" ]

#build
#docker build -t python_predict:2.0 .
#run
#docker run --name predict_refund0 -p 51100:80  --log-opt max-size=300m --log-opt max-file=3  -v /home/dockerdata/predict_refund0/models:/app/models \
# -v  /home/dockerdata/predict_refund0/server.py:/app/server.py registry.cn-hangzhou.aliyuncs.com/zhuwenshen/python_predict:2.0

#docker run --name python_predict -p 81:80 -v /home/dockerdata/python_predict/data:/app  python_predict:2.0
#docker run --rm --name python_predict -p 81:80 python_predict:2.0