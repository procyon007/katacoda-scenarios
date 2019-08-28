#!/bin/bash

DOCKER_IMAGE="procyon07/kata_image"

#rootディレクトへ移動
cd $HOME

#AWX公式githubから最新版を取得
git clone https://github.com/ansible/awx.git

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
sudo ansible-playbook -i inventory install.yml

#　インストール完了を表示
echo "AWX Install Complete"



for i in {1..2}
do
  docker run --net=awscompose_default --rm=true --name=host$i $DOCKER_IMAGE /sbin/init &
done
