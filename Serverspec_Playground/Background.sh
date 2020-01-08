#!/bin/bash

#セットアップ開始をログに出力
logger "Setup_Start"

#inventoryファイル生成
echo "[client:vars]" >>  inventory
echo "ansible_ssh_user=ansible ansible_ssh_pass=password123" >>  inventory
echo "[client]" >> inventory


#Katacoda用 Dockerイメージを指定
DOCKER_IMAGE="procyon07/kata_image"

# rubyとrailsのバージョンを指定
ruby_ver="2.6.5"

#Docker用Network名
dk_net="sp_play"

# 必要なパッケージ、Ansibleをインストール
yum -y update
yum -y install epel-release jq
yum -y install git make autoconf curl wget
yum -y install gcc-c++ glibc-headers openssl-devel readline libyaml-devel readline-devel zlib zlib-devel sqlite-devel bzip2
yum -y install openssh-clients python ansible
yum clean all

# inventoryファイルを生成


# rubyとbundleをダウンロード
git clone https://github.com/sstephenson/rbenv.git /usr/local/rbenv
git clone https://github.com/sstephenson/ruby-build.git /usr/local/rbenv/plugins/ruby-build

# コマンドでrbenvが使えるように設定
echo 'export RBENV_ROOT="/usr/local/rbenv"' >> /etc/profile.d/rbenv.sh
echo 'export PATH="${RBENV_ROOT}/bin:${PATH}"' >> /etc/profile.d/rbenv.sh
echo 'eval "$(rbenv init --no-rehash -)"' >> /etc/profile.d/rbenv.sh

# rubyをインストール
source /etc/profile.d/rbenv.sh; rbenv install ${ruby_ver}; rbenv global ${ruby_ver}

# Serverspeckをインストール
source /etc/profile.d/rbenv.sh; gem install serverspec rake highline

#Docker用ネットワーク作成
docker network create $dk_net

#設定用Dockerコンテナ起動
for i in 1 2
do
    docker run -d --security-opt label:disable --net=$dk_net --rm=true --name=host$i $DOCKER_IMAGE /sbin/init
    sleep 10
    IPADDR=`docker inspect host$i  | jq -r ".[0].NetworkSettings.Networks.$dk_net.IPAddress"`
    echo host$i ansible_ssh_host=${IPADDR:?}  >> inventory
done
wait
logger  "Setup_Complete"

