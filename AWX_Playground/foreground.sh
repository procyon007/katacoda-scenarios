#!/bin/bash

DOCKER_IMAGE="procyon07/kata_image"

#rootディレクトへ移動
cd $HOME > /dev/null 2>&1

#AWX公式githubから最新版を取得
git clone https://github.com/ansible/awx.git > /dev/null 2>&1

#インストーラのディレクトリへ移動
cd $HOME/awx/installer > /dev/null 2>&1

#必要モジュールを インストール
sudo pip3 install setuptools > /dev/null 2>&1
sudo pip3 install ansible > /dev/null 2>&1
sudo pip2.7 install docker > /dev/null 2>&1
sudo pip2.7 install docker-compose > /dev/null 2>&1
sudo pip2.7 install requests > /dev/null 2>&1

#AWXをインストール
sed -i s/"#project_data_dir"/project_data_dir/g inventory > /dev/null 2>&1
sudo ansible-playbook -i inventory install.yml > /dev/null 2>&1

#sudo docker run -b -anet=awxcompose_default --rm=true --name=host1 $DOCKER_IMAGE > /dev/null 2>&1
#sleep 60
#sudo docker run -b --net=awxcompose_default --name=host2 $DOCKER_IMAGE > /dev/null 2>&1

for i in {1..2}
do
sudo docker run --net=awxcompose_default --rm=true --name=host$i $DOCKER_IMAGE > /dev/null 2>&1
done