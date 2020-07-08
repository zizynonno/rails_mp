面白そうなので、勉強がてらRailsTutorialを

Rails+RSpec+Nginx+Unicorn+Docker

で改造してみた。

### 開発環境

開発言語:Ruby

フレームワーク:Rails,Bootstrap

ミドルウェア:MySQL,docker,Nginx,Unicorn

クラウド:Heroku

テスト:RSpec

その他：GitHub,CircleCI

### 起動

docker-compose build

docker-compose run rails db:create

docker-compose up
