SHELL := /bin/bash
PYTHONPATH := $(shell pwd)

ifneq (,$(wildcard .env))
	include .env
	export $(shell sed 's/=.*//' .env)
endif

download_airflow_cfg:
	bash scripts/download_airflow_cfg.sh

upload_airflow_cfg:
	bash scripts/upload_airflow_cfg.sh

upload_dags:
	bash scripts/upload_dags.sh

run_setup:
	bash scripts/run_setup.sh

download_setup_log:
	bash scripts/download_setup_log.sh

restart_airflow:
	yc compute instance restart airflow-vm