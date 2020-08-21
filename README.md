### デプロイしてる URL

https://stormy-stream-50795.herokuapp.com/

## アプリ概要

面白そうなので、勉強がてら RailsTutorial を Rails+RSpec+Nginx+Unicorn+Docker で改造してみた。

- Rails チュートリアルのサンプルを拡張したアプリです。
- オリジナルの機能に加え、docker や CircleCI の導入、RSpec の導入、キーワード検索機能、返信機能、いいね機能を追加し、変更を加えました。

### 開発環境

開発言語:Ruby

フレームワーク:Rails,Bootstrap

ミドルウェア:MySQL,docker,Nginx,Unicorn

クラウド:Heroku

テスト:RSpec

その他：GitHub,CircleCI

### 機能

- ログイン・ログアウト機能
  - Remember me 機能
- ユーザー機能(CRUD)
  - ユーザー一覧
  - ユーザー作成
  - ユーザー編集
  - ユーザー削除
  - 管理者ユーザー
- フォロー機能
  - ユーザーのフォロー
  - フォローしているユーザーの一覧機能
  - フォローされているユーザーの一覧機能
  - フォローの解除
- ツイート機能
  - ツイート作成
  - ツイート削除
- コメント機能**(+追加)**
  - 返信ボタンを押下すると、モーダルフォームが出現する
  - ツイートに対し返信できる
  - 返信先のユーザー ID が自動で付与される
- いいね機能**(+追加)**
  - 記事に対しいいねを押せる
- 検索機能**(+追加)**
  - キーワードによるユーザー検索
  - キーワードによる記事検索

### 起動

docker-compose build

docker-compose run rails db:create

docker-compose up
