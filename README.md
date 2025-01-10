# データベス設計

## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false |
| age_group          | integer | null: false |
| gender             | string  | null: false |


### Association

- has_many :posts, dependent: :destroy
- has_many :comments, dependent: :destroy
- has_many :reviews, dependent: :destroy
- has_many :requests
- has_many :notifications

## posts テーブル

| Column           | Type       | Options     |
| ---------------- | ---------- | ----------- |
| title            | string     | null: false |
| bike_genre       | integer    | null: false |
| engine_capacity	 | integer    | null: false |
| prefecture       | integer    | null: false |
| note             | text       | null: false |
| user             | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments, dependent: :destroy
- has_many :requests

## comments テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| content       | text       | null: false                    |
| post          | references | null: false, foreign_key: true |
| user          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :post

## reviews テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| post          | references | null: false, foreign_key: true |
| image         | integer    | null: false                    |
| rating        | integer    | null: false                    |
| comment       | text       |                                |

### Association

- belongs_to :user
- belongs_to :post

## requests テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| post          | references | null: false, foreign_key: true |
| status        | string     | default: 'pending'             |

### Association

- belongs_to :post
- belongs_to :user

## notification テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| message       | string     | null: false                    |
| read_status   | boolean    | default: false                 |

### Association

- belongs_to :user