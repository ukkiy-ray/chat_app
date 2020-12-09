# README

# アプリケーションの概要
- このアプリケーションは、写真付きメッセージ投稿機能・チャットルーム作成、削除機能・ユーザー管理機能を備えたチャットアプリケーションです。

### チャット機能の挙動(Gif)
[![Image from Gyazo](https://i.gyazo.com/3687fa9c9e70edd39189ba40ef1244c2.gif)](https://gyazo.com/3687fa9c9e70edd39189ba40ef1244c2)

# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association

- has_many :room_users
- has_many :rooms, through: room_users
- has_many :messages

## rooms テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |

### Association

- has_many :room_users
- has_many :users, through: room_users
- has_many :messages

## room_users テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| room   | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user

## messages テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     |                                |
| user    | references | null: false, foreign_key: true |
| room    | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user