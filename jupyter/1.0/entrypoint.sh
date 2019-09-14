#!/bin/sh
if [ $PASSWD != '' ]; then
	PASSWD=$(python -c 'from notebook.auth import passwd;import os; print(passwd(os.popen("echo -n $PASSWD").read()))')
	echo "c.NotebookApp.password=u'${PASSWD}'" > ~/.jupyter/jupyter_notebook_config.py
	echo "生成密码$PASSWD"
	PASSWD=''
fi
cat ~/.jupyter/jupyter_notebook_config.py
jupyter notebook --allow-root --no-browser --ip='0.0.0.0' --port=6006 --notebook-dir=/app/data
