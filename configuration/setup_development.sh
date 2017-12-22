#!/usr/bin/env bash

# 换成 root 用户运行
sudo su

# 换成中科大的源
ln -f -s /root/chat/configuration/sources.list /etc/apt/sources.list
mkdir /root/.pip
ln -f -s /root/chat/configuration /root/.pip/pip.conf

# 装依赖
apt-get update
apt-get install -y python3-pip
pip3 install -U pip setuptools wheel
pip3 install flask eventlet flask-socketio