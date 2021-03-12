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