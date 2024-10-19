# Запустить setup.sh на сервере

ssh $AIRFLOW_VM_USER@$AIRFLOW_HOST "sudo bash setup.sh > setup.log 2>&1"