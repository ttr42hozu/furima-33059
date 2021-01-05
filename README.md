## users テーブル

| Column             | Type   | Option                    |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false, unique: true |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false, unique: true |
| first_name         | string | null: false               |
| last_name          | string | null: false               |
| first_name_kana    | string | null: false               |
| last_name_kana     | string | null: false               |
| birthday           | date   | null: false               |

### Association
has_many :items
has_many :orders

## items テーブル

| Column             | Type       | Option            |
| ------------------ | ---------- | ----------------- |
| title              | string     | null: false       |
| description        | text       | null: false       |
| category_id        | integer    | null: false       |
| status_id          | integer    | null: false       |
| shipping_charge_id | integer    | null: false       |
| ship_to_area_id    | integer    | null: false       |
| ship_to_day_id     | integer    | null: false       |
| price              | integer    | null: false       |
| user               | references | foreign_key: true |

### Association
belongs_to :user
has_one :order


## orders テーブル

| Column | Type       | Option            |
| ------ | ---------- | ----------------- |
| user   | references | foreign_key: true |
| item   | references | foreign_key: true |

### Association
belongs_to :user
belongs_to :item
has_one :address

## addresses テーブル

| Column          | Type       | Option            |
| --------------- | ---------- | ----------------- |
| postcode        | string     | null: false       |
| ship_to_area_id | integer    | null: false       |
| city            | string     | null: false       |
| block           | string     | null: false       |
| building        | string     |                   |
| phone_number    | string     | null: false       |
| order           | references | foreign_key: true |


### Association
belongs_to :order