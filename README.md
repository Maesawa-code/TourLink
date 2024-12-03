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
- has_many :group_memberships, dependent: :destroy
- has_many :groups, through: :group_memberships
- has_many :reviews, dependent: :destroy
- has_many :group_messages, dependent: :destroy

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
- has_one :group, dependent: :destroy

## comments テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| content       | text       | null: false                    |
| post          | references | null: false, foreign_key: true |
| user          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :post

## groups テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| post          | references | null: false, foreign_key: true |

### Association

- belongs_to :post
- has_many :users, through: :group_memberships
- has_many :group_memberships, dependent: :destroy
- has_many :group_messages, dependent: :destroy

## group_memberships テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| group         | references | null: false, foreign_key: true |
| user          | references | null: false, foreign_key: true |

### Association

- belongs_to :group
- belongs_to :user

## group_messages テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| content       | text       | null: false                    |
| group         | references | null: false, foreign_key: true |
| user          | references | null: false, foreign_key: true |

### Association

- belongs_to :group
- belongs_to :user

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

