# Загрузка DAG-файлов в Airflow

scp -r $PYTHONPATH/airflow/dags/*.py $AIRFLOW_VM_USER@$AIRFLOW_HOST:$AIRFLOW_DAGS_FOLDER