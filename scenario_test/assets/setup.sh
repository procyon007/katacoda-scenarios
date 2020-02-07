#!/bin/bash
echo "環境を準備しております。完了まで暫くお待ちください"
while :
do
  setup_tmp=`tail -1 /var/log/messages | awk -F" " '{print $6}'`
  if [ "$setup_tmp" = "Setup_Complete" ]; then
    echo "#########################"
    echo "環境の準備が完了しました。"
    echo "#########################"
    break
  fi
done