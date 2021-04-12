#!/bin/bash

DOCKER_IMAGE="procyon07/kata_image"

#rootディレクトへ移動
cd $HOME

#AWX公式githubから最新版を取得
git clone https://github.com/ansible/awx.git -b 17.0.1 --depth 1

#インストーラのディレクトリへ移動
cd $HOME/awx/installer

#必要モジュールを インストール
sudo pip3 install setuptools
sudo pip3 install ansible
sudo pip2.7 install docker
sudo pip2.7 install docker-compose
sudo pip2.7 install requests

#AWXをインストール
sed -i s/"#project_data_dir"/project_data_dir/g inventory
sed -i s/"# admin_password=password"/admin_password=P@ssw0rd/g inventory

sudo ansible-playbook -i inventory install.yml

#sudo docker run -b --net=awxcompose_default --rm=true --name=host1 $DOCKER_IMAGE > /dev/null 2>&1
#sleep 180
#sudo docker run -b --net=awxcompose_default --name=host2 $DOCKER_IMAGE > /dev/null 2>&1

for i in {1..2}
do
sudo docker run --net=awxcompose_default --rm=true --name=host$i $DOCKER_IMAGE
done
