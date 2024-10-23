# book_log_list
Railsチュートリアルのサンプルアプリケーションをベースに読んだ本を共有し合うアプリケーションです。
現在開発途中ですが、[こちら](https://taruha.site/)に公開中です。
## スコープ
### スコープ1
- さくらvpsにデプロイ、ドメイン取得、ssl化
- amazon urlから、本のタイトルと画像をとってくる
- とってきた情報とコメントを表示、編集、削除ができる
- githubアクションで自動デプロイ
### スコープ2
- kindle libraryから自分が購入した本を一括で登録
など

# 技術関連
## フレームワーク
- Ruby on Rails
  - gem
    - mechanize(スクレイピング)
## ミドルウェア
- PostgreSQL
- nginx
## サーバー
- さくらvps
## ドメイン
- お名前.com
