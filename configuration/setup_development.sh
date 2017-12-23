#!/usr/bin/env bash

# 如何使用
# bash -x setup_development.sh

# 换成 root 用户运行
sudo su

# ${source_root} 是代码所在目录
source_root='/root/chat'

# 换成中科大的源
ln -f -s ${source_root}/configuration/sources.list /etc/apt/sources.list
mkdir /root/.pip
ln -f -s ${source_root}/configuration /root/.pip/pip.conf

# 装依赖
apt-get update
apt-get install -y python3-pip supervisor
pip3 install -U pip setuptools wheel
pip3 install flask eventlet flask-socketio

# 建立 supervisor 软连接
ln -f -s ${source_root}/configuration/chat.conf /etc/supervisor/conf.d/chat.conf

service supervisor restart
