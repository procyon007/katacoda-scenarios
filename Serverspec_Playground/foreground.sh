#!/bin/bash

#セットアップ確認シェルを実行
./setup.sh

#処理完了後、シェルを削除
wait
rm -f setup.sh