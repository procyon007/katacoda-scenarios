Ansible Tower/AWXは、以下図のようにOrganization(組織)に、ユーザ・プレイブック・対象ホストなど  
様々な要素（オブジェクト）が結びついた階層構造となっている  
  
![object](https://docs.ansible.com/ansible-tower/latest/html/userguide/_images/TowerHierarchy.png)  
※https://docs.ansible.com/ansible-tower/latest/html/userguide/organizations.html より参考  
  
■上記オブジェクトの意味


| オブジェクト名 | 意味 |
|:-----------:|:------------:|
| Oranaization | ユーザ、チーム、プロジェクト及びインベントリーの論理コレクション |
| Inventories | ジョブの実行対象となるホスト |
| Teams | Oranaizationに関連付けられた、ユーザ・プロジェクト・認証情報のコレクション |
| Projects | Oranaizationに関連付けられたPlaybookのコレクション |
| Groups | Oranaizationに関連付けられた、ホストをグルーピングしたもの<br>Ansible CoreのGroup変数 |
| Hosts | Ansible Tower/AWXで管理される機器<br>Ansible CoreのHost変数 |
| Credentials | Hostsに登録した機器へ接続する際に使用する認証情報 |
| Credentials | Hostsに登録した機器へ接続する際に使用する認証情報 |