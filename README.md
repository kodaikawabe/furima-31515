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

| Column           | Type      | Options     |
| ---------------- | --------- | ------------|
| name             | text      | null: false |
| image            |           |             |
| price            | integer   | null: false |
| user             | reference |             |
| category         | text      | null: false |
| status           | text      | null: false |
| shipping_charges | text      | null: false |
| area             | text      | null: false |
| date_of_shipment | text      | null: false |
| item             | reference |             |

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
| postal_code        | text        | null: false |
| prefectures        | text        | null: false |
| municipal_district | text        | null: false |
| address            | text        | null: false |
| building_name      | text        | null: false |
| phone_number       | integer     |             |
| buy                | reference   |             |


### Association
- belongs to :buy

