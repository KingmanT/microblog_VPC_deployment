#!/bin/bash

sudo apt update

git clone https://github.com/KingmanT/microblog_VPC_deployment
sudo apt install -y software-properties-common
sudo add-apt-repository -y ppa:deadsnakes/ppa
sudo apt install -y python3.9
sudo apt install -y python3.9-venv 
sudo apt install -y python3-pip
cd microblog_VPC_deployment
python3.9 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
pip install gunicorn pymysql cryptography
FLASK_APP=microblog.py
flask translate compile
flask db upgrade
gunicorn -b :5000 -w 4 microblog:app --daemon
