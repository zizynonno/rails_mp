面白そうなので、勉強がてら RailsTutorial を

Rails+RSpec+Nginx+Unicorn+Docker

で改造してみた。

### 開発環境

開発言語:Ruby

フレームワーク:Rails,Bootstrap

ミドルウェア:MySQL,docker,Nginx,Unicorn

クラウド:Heroku

テスト:RSpec

その他：GitHub,CircleCI

### 機能

CRUD 機能
ログインログアウト機能
Remember me 機能
画像アップロード機能
フォローフォロワー機能
検索機能
いいね機能
ユーザー ID 機能

### 起動

docker-compose build

docker-compose run rails db:create

docker-compose up

### デプロイしてる URL

https://stormy-stream-50795.herokuapp.com/
