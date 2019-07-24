# posh-gyazo
PowerShellからGyazoる

## 配置

1. C:\Users\user_name\Documents\WindowsPowerShell\ModulesにSend-Gyazoフォルダを作成し、そこにSend-Gyazo.psm1を配置します。
1. プロファイルに`$gyazo_path = 'gyazoの実行ファイルのパス'`を追記します。

## 使用例

引数なしでクリップボードの画像を送信

~~~powershell
Send-Gyazo
~~~

画像ファイルパス指定

~~~powershell
Send-Gyazo ./hoge.png
~~~

パイプで指定

~~~powershell
Get-ChildItem hoge.png | Send-Gyazo
~~~

画像を指定

~~~powershell
Get-Clipboard -Format Image | Send-Gyazo
~~~
