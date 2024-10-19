# Загрузить airflow.cfg на сервер

# Пример с переменными и загрузкой файла airflow.cfg на сервер

scp $PYTHONPATH/airflow/airflow.cfg $AIRFLOW_VM_USER@$AIRFLOW_HOST:$AIRFLOW_HOME/airflow.cfg