#!/bin/bash
echo "環境を準備しております。完了まで暫くお待ちください"
while :
do
  setup_tmp=`tail -1 /var/log/messages | awk -F" " '{print $6}'`
  if [ "$setup_tmp" = "Setup_Complete" ]; then
    echo "環境準備が完了しました。"
    break
  fi
done