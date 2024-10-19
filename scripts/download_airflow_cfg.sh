# Скачать файл airflow.cfg с удаленного сервера

scp $AIRFLOW_VM_USER@$AIRFLOW_HOST:$AIRFLOW_HOME/airflow.cfg $PYTHONPATH/airflow/airflow.cfg