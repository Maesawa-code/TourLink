## アプリケーション名
TourLink

---

## アプリケーション概要
バイクツーリング仲間を探すためのマッチングアプリです。ユーザーは自身のプロフィールやバイク情報を登録し、ツーリング募集の投稿やコメント機能を通じてコミュニケーションを取ることができます。また、ツーリング募集への参加希望と承認制の管理機能を提供します。さらに、レビュー機能を活用してツーリングスポットの評価や感想を画像付きで共有できます。

---

## URL
デプロイ済みのURL：https://tourlink.onrender.com

---

## テスト用アカウント
- ユーザー1
  - メールアドレス：test1@test
  - パスワード：aaa111
- ユーザー2
  - メールアドレス：test2@test
  - パスワード：aaa222
- ユーザー3
  - メールアドレス：test3@test
  - パスワード：aaa333

---

## 利用方法
1. 名前、性別、バイクのジャンル、バイクの排気量、画像を選択してアカウントを作成し、ログインします。
2. ツーリング募集投稿を作成または募集に応募します。
3. 募集投稿へのコメント機能を利用して詳細を相談します。
4. ツーリング後はレビュー機能を利用してスポットの感想や評価を共有します。

---

## アプリケーションを作成した背景
ライダーは一緒にツーリングに行く仲間を探したり、作ったりすることが難しい場合があります。SNSではツーリング仲間を見つけるのが大変だったり、条件が合わなかったりする問題がありました。このアプリは、同じ趣味や興味を持つライダー同士を簡単にマッチングし、計画や実施を円滑に進められるようサポートするために作成しました。

---

## 実装した機能についての画像やGIFおよびその説明
1. **ユーザー管理機能**
   - 新規登録、ログイン、ログアウト機能を実装しました。
   - プロフィール編集が可能です。

2. **ポスト機能**
   - ツーリングタイトル、予定日、バイクジャンル、排気量、ツーリングする都道府県、メモ（任意）を入力して募集投稿を作成できます。
   - コメント機能を利用して詳細の相談が可能です。
   - 投稿の編集、削除が可能です。

3. **レビュー機能**
   - タイトルと評価（1〜5段階）、コメント（任意）、画像を添付して投稿できます。

4. **参加リクエスト機能**
   - ツーリング募集投稿へ参加リクエストを送信できます。
   - リクエストを受け取ったユーザーは承認または拒否を選択できます。
   - 承認または拒否の際にコメントを追加して相手に送信することが可能です。
1. **ユーザー管理機能**
   - 新規登録、ログイン、ログアウト機能を実装しました。
   - プロフィール編集が可能です。

2. **ポスト機能**
   - ツーリングタイトル、予定日、バイクジャンル、排気量、ツーリングする都道府県、メモ（任意）を入力して募集投稿を作成できます。
   - コメント機能を利用して詳細の相談が可能です。
   - 投稿の編集、削除が可能です。

3. **レビュー機能**
   - タイトルと評価（1〜5段階）、コメント（任意）、画像を添付して投稿できます。

---

## 実装予定の機能
- **プロフィール閲覧機能**：他ユーザーのプロフィールを確認できる機能です。
- **ガソリンスタンド表示機能**：周辺のガソリンスタンドを強調して地図上に表示する機能です。
---

## データベース設計

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

---

## 画面遷移図
画面遷移図を添付予定です。

---

## 開発環境
- 言語：Ruby 3.2.2
- フレームワーク：Ruby on Rails 7.0
- データベース：MySQL 8.0
- フロントエンド：HTML, CSS, JavaScript
- デプロイ：Render

---

## ローカルでの動作方法
1. リポジトリをクローンします。
```
git clone <リポジトリURL>
```
2. 必要なGemをインストールします。
```
bundle install
```
3. データベースをセットアップします。
```
rails db:create
rails db:migrate
```
4. サーバーを起動します。
```
rails s
```
5. ブラウザで`http://localhost:3000`にアクセスします。

---

## 工夫したポイント
- **ユーザビリティ向上**：直感的なUI設計を意識しました。
- **拡張性を重視した設計**：新機能を追加しやすい構成を実現しました。
- **データ管理の効率化**：ActiveHashを利用してデータ管理を簡素化しました。
- **セキュリティ対策**：Basic認証やストロングパラメータを導入しました。

---

## 制作時間
約70時間
