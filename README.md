## usersテーブル

| Column             | Type   | Options                    |
| ------------------ | ------ | -------------------------- |
| nickname           | string | null: false                |
| email              | string | null: false , unique: true |
| encrypted_password | string | null: false                |
| last_name          | string | null: false                |
| first_name         | string | null: false                |
| last_name_kana     | string | null: false                |
| first_name_kana    | string | null: false                |
| birth_date         | string | null: false                |


### Association
- has_many :items
- has_many :shoppings

## itemsテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| item_name          | string     | null: false                    |
| item_description   | string     | null: false                    |
| category           | string     | null: false                    |
| item_condition     | string     | null: false                    |
| delivery_charge    | string     | null: false                    |
| shipping_area      | string     | null: false                    |
| delivery_time      | string     | null: false                    |
| price              | integer    | null: false                    |
| user_id            | references | null: false, foreign_key: true |


### Association
- belongs_to :user
- has_one :shopping


## shoppingsテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user_id            | references | null: false, foreign_key: true |
| item_id            | references | null: false, foreign_key: true |


### Association
- belongs_to :user
- belongs_to :item
- has_one :shipping address


## shipping_addressesテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| postal_code        | integer    | null: false                    |
| region             | string     | null: false                    |
| city               | string     | null: false                    |
| house_number       | string     | null: false                    |
| building_name      | string     |                                |
| phone_number       | integer    | null: false                    |
| shopping_id        | references | null: false, foreign_key: true |


### Association
- belongs_to :shopping