#!/bin/bash

#rootディレクトへ移動
cd $HOME

#AWX公式githubから最新版を取得
git clone https://github.com/ansible/awx.git

#インストーラディレクトリへ移動
cd $HOME/awx/installer

#AWXをインストール
sudo ansible-playbook -i inventory install.yml

#　インストール完了を表示
echo "AWX Install Complete"
