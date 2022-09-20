## users テーブル

| Column             | Type     | Options                   |
| ------------------ | -------- | ------------------------- |
| nickname           | string   | null: false               |
| email              | string   | null: false, unique: true |
| password           | string   | null: false               |
| first_name         | string   | null: false               |
| last_name          | string   | null: false               |
| first_kana         | string   | null: false               |
| first_kana         | string   | null: false               |
| birth_year         | integer  | null: false               |
| birth_month        | integer  | null: false               |
| birth_day          | integer  | null: false               |

Assosiation
has_one :credit_card
has_one :sending_destination
has_many :items
has_many :comments

## credit_cardsテーブル テーブル

| Column             | Type     | Options                   |
| ------------------ | -------- | ------------------------- |
| user_id            | integer  | null: false               |
| customer_id        | string   | null: false               |
| card_id            | string   | null: false               |

Association
belongs_to :user



## sending_destinations テーブル 

| Column             | Type         | Options                        |
| ------------------ | ------------ | ------------------------------ |
| post_code          | string       | null: false                    |
| prefecture         | string       | null: false                    |
| city               | string       | null: false                    |
| house_number       | string       |                                |
| building_name      | string       | null: false                    |
| phone_number       | string       | null: false                    |
| user               | references   | null: false, foreign_key: true |

Assosiation
belongs_to :user

## comments テーブル

| Column             | Type         | Options                        |
| ------------------ | ------------ | ------------------------------ |
| body               | text         |                                |
| user               | references   | null: false                    |
| item               | references   | null: false                    |

Assosiation
belongs_to :user
belongs_to :item


## items テーブル

| Column             | Type       | Options                         |
| ------------------ | ---------- | ------------------------------- |
| name               | string     | null: false                     |
| price              | integer    | null: false                     |
| item_description   | string     |                                 |
| item_condition_id  | integer    | null: false, foreign_key: true  |
| postage_payer_id   | integer    | null: false, foreign_key: true  |
| preparation_day_id | integer    | null: false, foreign_key: true  |
| prefecture_id      | integer    | null: false, foreign_key: true  |
| buyer              | references | foreign_key: true               |
| seller             | references | null: false, foreign_key: true  |
| category           | references | null: false, foreign_key: true  |
| brand              | integer    | foreign_key: true               |
| image              | references | null: false, foreign_key: true  |

Assosiation
has_many :item_images
has_many :comments
belongs_to :category


## categories テーブル

| Column             | Type       | Options                         |
| ------------------ | ---------- | ------------------------------- |
| name               | string     | null: false                     |
| ancestry           | string     | null: false                     |

Assosiation
has_many :items
has_ancestry

## item_images テーブル

| Column             | Type       | Options                         |
| ------------------ | ---------- | ------------------------------- |
| image              | text       | null: false                     |
| item               | references | null: false, foreign_key: true  |


Assosiation
belongs_to :item