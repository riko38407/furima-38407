## users テーブル

| Column             | Type     | Options                   |
| ------------------ | -------- | ------------------------- |
| nickname           | string   | null: false               |
| email              | string   | null: false, unique: true |
| encrypted_password | string   | null: false, unique: true |
| first_name         | string   | null: false               |
| last_name          | string   | null: false               |
| first_kana         | string   | null: false               |
| last_kana          | string   | null: false               |
| birthday           | data     | null: false               |


Assosiation
has_many :items
has_many :buying historys



## buying_historys テーブル　

| Column             | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| user               | references | null: false,foreign_key: true |
| item               | references | null: false,foreign_key: true |

Association
belongs_to :user
belongs_to :item
has_one :sending_destination



## sending_destinations テーブル 

| Column             | Type         | Options                         |
| ------------------ | ------------ | ------------------------------- |
| buying_historys    | references   | null: false,foreign_key: true |
| prefecture_id      | integer      | null: false                     |
| city               | string       | null: false                     |
| house_number       | string       | null: false                     |
| building_name      | string       |                                 |
| phone_number       | string       | null: false                     |
| post_code          | string       | null: false                     |

Assosiation
belongs_to : buying_history


## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | -------------------------------|
| user               | references | null: false, foreign_key: true |
| name               | string     | null: false                    |
| description        | text       | null: false                    |
| category_id        | integer    | null: false                    |
| item_condition_id  | integer    | null: false                    |
| postage_payer_id   | integer    | null: false                    |
| preparation_day_id | integer    | null: false                    |
| prefecture_id      | integer    | null: false                    |
| shipping_date_id   | integer    | null: false                    |
| price              | integer    | null: false                    |

Assosiation
belongs_to :user
has_one :buying_history

