Step1～2は、説明のみとなるためterminalは使用しません。  
※説明画面と、Terminal画面の境界線をドラックして広げて確認してください。

## Ansible Tower概要  
  
コマンドラインで使用するAnsibleだけで、構成管理やアプリケーションのデプロイなどは可能ですが  
権限や実行結果の可視化などの管理機能が含まれていない為、複数部署が使用するような大規模環境での利用に向いておりません。  
Ansible TowerではWebインターフェースと、Ansible単体で不足している以下機能を実装しています。  
  
- ジョブコントロール  
  - スケジューリングによる柔軟な実行  
  - ジョブの並列・一括実行  
  - REST API提供による、他システムからの各機能呼び出し  
  
- 権限管理  
  - ユーザ/グループ/組織単位での実行権限管理  
  - パスワード・秘密鍵などの認証情報暗号化  
  
- 可視化  
  - ダッシュボードによる実行ジョブ・処理結果の可視化  
  - ログの表示  
    
## AWXの概要  
AWXはAnsible TowerのOSS版ですが、CentOSとは異なりアップストリーム（開発版）と位置されております。  
その為、商用（本番環境）での利用は控え、Ansible Tower導入前の動作確認などで使用されております。  
本コースでは、AWS（Docker版）を使用いたします。