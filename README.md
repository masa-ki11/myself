# README

## myself
  ![myself](https://user-images.githubusercontent.com/67939220/91795805-99838800-ec59-11ea-89bb-0a25f994abc0.jpg)

## 概要
- 特化型マッチングアプリ
- ユーザー登録、編集
- フォロー機能
- 相互フォローでトークルーム作成可能(DM)
- トップページユーザー画像選択で画像拡大

## 本番環境
- https://myself827.herokuapp.com/
- テストアカウント：test5@gmail.com / pass: 55555555(その他アカウント：test4@gmail.com/pass:44444444のように数字を変えることで別アカウントでのログインもできます)

- トップページ左、矢印にマウスオーバーして頂くと吹出しアイコンが現れます。そちらにアクセス頂くとマッチング一覧がご覧いただけます。(相互フォローユーザーがいない場合ユーザーは表示されません)
- 適当なユーザーにアクセス頂くと、詳細ページに移るので"トークルーム作成"、または"ダイレクトメッセージ"にアクセス頂くとトークルームへとページ移動します。

## 制作意図
- 自身の趣味であるフェス参戦において、一人での参加者を多く見かけることがあり、また、自身も一人での参加をすることがあるが、現地で仲間ができ楽しく参加することができた経験から制作。

## 工夫したポイント
- ユーザーが増えた時のことを想定し、ユーザーはランダム表示
- 画像をちゃんと見たい人もいるであろうことから画像拡大
- twitter埋め込みによるフェス情報の提供

## 開発環境
- Ruby/Ruby on Rails/MySQL/Github/AWS/Visual Studio Code/heroku

## 今後実装したい機能
- フェスごとのグループ作成
- タグ付け
- 検索機能

## DB設計

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|
|email|string|null: false, unique: true|
|password|string|null: false, unique: true|
|comment|string|
|image|string|

### association
- has_many :rooms, through: :user_rooms
- has_many :user_rooms
- has_many :chats
- has_many :relationships

## roomsテーブル

|Column|Type|Options|
|------|----|-------|

### association
- has_many :users, through: :user_rooms
- has_many :user_rooms
- has_many :chats

## user_roomsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|room_id|references|null: false, foreign_key: true|

### association
- belongs_to :user
- belongs_to :room

## chatsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|room_id|references|null: false, foreign_key: true|
|comment|string|

### association
- belongs_to :user
- belongs_to :room

## relationshipsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|follow_id|references|null: false, foreign_key: true|

### association
- belongs_to :user
- belongs_to :follow, class_name: 'User'