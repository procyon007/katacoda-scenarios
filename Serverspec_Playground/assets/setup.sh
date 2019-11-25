#!/bin/bash
#変数設定
ansible="/etc/ansible/hosts"

#Setup開始を通知
echo "環境のセットアップを開始、完了までお待ち下さい"

#ansible setup完了確認
while :
do
  if [ -a /etc/ansible/hosts ]; then
    echo "ansibleのインストール完了"
    break
  fi
done