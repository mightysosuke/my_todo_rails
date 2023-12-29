# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


https://zenn.dev/taku1115/articles/6c9fa97ab37e38
https://qiita.com/ydammatsu/items/a2fbae968149bf2c1999

## コマンド

```
make docker_build
make new
make docker_start
make migrate
```

## 接続先

`localhost:3010`

## access_tokenの取得方法

```
curl --url https://mytodo.jp.auth0.com/oauth/token \
  --header 'content-type: application/json' \
  --data "{\"client_id\":\"${CLIENT_ID}\",\"client_secret\":\"${CLIENT_SECRET}\",\"audience\":\"https://api.mytodo.com/\",\"grant_type\":\"client_credentials\"}"
```
