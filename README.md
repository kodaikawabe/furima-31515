## usersテーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ------------|
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| first_name         | string | null: false |
| family_name        | string | null: false |
| first_name_kana    | string | null: false |
| family_name_kana   | string | null: false |
| birthday           | date   | null: false |

### Association
- has_many :items
- has_many :buys
- has_many :comments


## itemsテーブル

| Column              | Type      | Options     |
| ------------------- | --------- | ------------|
| name                | text      | null: false |
| price               | integer   | null: false |
| category_id         | integer   | null: false |
| status_id           | integer   | null: false |
| shipping_charges_id | integer   | null: false |
| area_id             | integer   | null: false |
| date_of_shipment_id | integer   | null: false |
| user                | reference |             |

### Association
- belongs to :user
- has_many :comments
- has one :buy

## commentsテーブル

| Column      | Type      | Options     |
| ----------- | --------- | ------------|
| text        | text      | null: false |
| user        | reference |             |
| item        | reference |             |

### Association
- belongs to :user
- belongs to :item

## buysテーブル

| Column           | Type        | Options     |
| ---------------- | ----------- | ------------|
| user             | reference   |             |
| item             | reference   |             |


### Association
- belongs to :user
- belongs to :item
- has_one :address

## addressesテーブル

| Column             | Type        | Options     |
| ------------------ | ----------- | ------------|
| postal_code        | string      | null: false |
| prefectures_id     | integer     | null: false |
| municipal_district | string      | null: false |
| address            | string      | null: false |
| building_name      | string      | null: false |
| phone_number       | string      | null: false |
| buy                | reference   |             |


### Association
- belongs to :buy

