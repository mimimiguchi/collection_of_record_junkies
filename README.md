# README

## usersテーブル

| Column             | Type   | Options                  |
| ------------------ | ------ | ------------------------ |
| email              | string | null: false, unique: true|
| encrypted_password | string | null: false              |
| nickname           | string | null: false              |
| last_name          | string | null: false              |
| first_name         | string | null: false              |
| last_name_kana     | string | null: false              |
| first_name_kana    | string | null: false              |
| birthday           | date   | null: false              |

### Association
- has_many :collections
- has_many :purchases
- has_many :wants
- has_many :pasts


## collectionsテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| music_id           | integer    | null: false                    |
| title              | string     | null: false                    |
| artist             | string     | null: false                    |
| year               | string     |                                |
| description        | text       |                                |
| size_id            | integer    | null: false                    |
| rpm_id             | integer    | null: false                    |
| status_id          | integer    | null: false                    |
| delivery_charge_id | integer    | null: false                    |
| prefecture_id      | integer    | null: false                    |
| delivery_day_id    | integer    | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_many :wants
- has_one :purchase
- has_one :past


## wantsテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| collection    | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :collection


## purchasesテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| collection    | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :collection
- has_one :address
- has_one :past


## addressesテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postcode      | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| block         | string     | null: false                    |
| building      | string     |                                |
| phone_number  | string     | null: false                    |
| purchase      | references | null: false, foreign_key: true |

### Association
- belongs_to :purchase


## pastsテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| collection    | references | null: false, foreign_key: true |
| purchase      | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :collection
- belongs_to :purchase