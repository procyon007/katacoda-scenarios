#!/bin/bash
#echo "Start job"
#rootディレクトへ移動
cd $HOME

#AWX公式githubから最新版を取得
git clone https://github.com/ansible/awx.git

#インストーラディレクトリへ移動
cd $HOME/awx/installer

#Docker インストール
sudo apt-get remove docker.io 
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
cd /usr/lib/python3/dist-packages
sudo ln -s apt_pkg.cpython-{35m,37m}-x86_64-linux-gnu.so
sudo add-apt-repository \
  "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) \
  stable"
sudo apt-get update
sudo apt-get install -y docker-ce

#ansible インストール
sudo pip3 install setuptools
sudo pip3 install ansible

#AWXをインストール
sudo ansible-playbook -i inventory install.yml

#　インストール完了を表示
echo "AWX Install Complete"
