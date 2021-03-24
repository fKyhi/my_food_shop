# My Food Shop
### 店舗情報管理、情報共有のためのアプリケーション

![toppage](https://i.gyazo.com/dacc78415951482c5887e2922cd223e4.jpg)



# 概要

### 自分のお気に入りの店舗情報を管理できる
### 店舗情報を友人と共有できる

自分が行った店舗の美味しかった料理や住所をメモして、
いつでもその店舗の詳細まで思い出せる様にできると同時に、
その情報を友人と共有でき、また友人が行ってみて美味しかったものも
確認することができる。


# APP URL
### **https://my-food-shop.herokuapp.com/**

# 利用方法

#### `✔トップページから新規登録/ログイン`
#### `✔一覧画面へ遷移する`
#### `✔新規投稿は右下の投稿アイコンをクリック`
#### `✔投稿完了後は一覧画面へ戻る`<br>
![Iamge from Gyazo](https://i.gyazo.com/f07f54ecba76dd2cf509e7915687a0a8.gif)

![Image from Gyazo](https://i.gyazo.com/135adcc0c54f7f93e30e97ccf445fa3b.gif)
<br>

#### `✔一覧画面から1つの投稿を選択→投稿詳細画面へ遷移する`
#### `✔投稿者本人であれば投稿の編集/削除が投稿詳細画面から可能になる`<br>
![Image from Gyazo](https://i.gyazo.com/050618e4ab9039b975768aea7930b8cf.gif)
<br>

#### `✔投稿詳細画面からその店舗の料理情報を投稿できる`
#### `✔投稿完了後は店舗情報詳細画面へ戻る`
![Image from Gyazo](https://i.gyazo.com/e4c3603eb4fe7cf66de871d7d747d174.gif)

![Image from Gyazo](https://i.gyazo.com/96ddc0d6cadfd274aef4527b23351def.gif)



# 課題解決
| ユーザーストーリーからの考える課題 | 課題解決 |
| ---------------------------- |-------- |
| 店舗の場所はわかるが何の店舗だったのか分からない課題 | 店舗の説明文を入れることでその店舗の詳細を思い出すことができる |
| 店舗で何が美味しかったか分からない課題 | 写真/料理名/説明文を加えることで詳細を思い出すことができる |
| 店舗の口コミを見ても知らない人の感想のため、信頼しづらい課題 | 味覚の合う知り合いの投稿であるため、信頼できる |


# 機能一覧
| 機能 | 概要 |
| ------------- | ----------------------------- |
| ユーザー管理機能 | 新規登録/ログイン/ログアウトが可能 |
| ユーザー情報編集/削除機能 | ログイン中のユーザーでアカウント本人であればプロフィール編集/削除が可能 |
| 店舗投稿機能 | 画像付きで詳細投稿が可能 |
| 店舗投稿詳細表示機能 | 各投稿詳細が詳細ページで閲覧可能 |
| 店舗投稿編集/削除機能 | 投稿者本人のみ投稿編集/削除が可能 |
| 料理投稿機能 | 画像付きで詳細投稿が可能 |
| 料理投稿編集/削除機能 | 投稿者本人のみ編集/削除が可能 |


# 開発環境
- VScode
- Ruby 2.6.5
- rails 6.0.3.5
- gem 3.0.3
- heroku 7.510
- mysql 5.6.50

# DB設計

## usersテーブル

| Column     | Type       | Options     |
| ---------- | ---------- | ----------- |
| email      | string     | null: false |
| password   | string     | null: false |
| nickname   | string     | null: false |

### Association
- has_many :shops
- has_many :foods

## shopsテーブル

| Column      | Type       | Options           |
| ----------  | ---------- | ----------------- |
| name        | string     | null: false       |
| category_id | integer    | null: false       |
| address     | text       | null: false       |
| user        | references | foreign_key: true |
| explain     | text       | null: false       |

### Association
- belongs_to :user
- has_many :foods

## foodsテーブル

| Column      | Type       | Options           |
| ----------  | ---------- | ----------------- |
| name        | string     | null: false       |
| explain     | text       | null: false       |
| shop        | references | foreign_key: true |
| user        | references | foreign_key: true |

### Association
- belongs_to :user
- belongs_to :shop