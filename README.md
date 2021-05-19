# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions


## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|password|string|null: false|
|email|string|null: false, unique: true, index: true|
### Association
- has_many :items
- has_many :comments
- has_one :profile
- has_one:credit_card
- has_one :addresses


## profileテーブル
|Column|Type|Options|
|------|----|-------|
|first_name|string|null: false|
|family_name|string|null: false|
|fast_name_kana|string|null: false|
|family_name_kana|string|null: false|
|birthday|data||
|introduction|string||
|user_id|references|null: false, unique: true, index: true|
### Association
- belongs_to :user


## addressテーブル
|Column|Type|Options|
|------|----|-------|
|address_first_name|string|null: false|
|address_family_name|string|null: false|
|address_fast_name_kana|string|null: false|
|address_family_name_kana|string|null: false|
|post_code|integer|null: false|
|prefecture_code|integer|null: false|
|city|string|null: false|
|address_line|integer|null: false|
|building_name|string||
|phone_number|integer|null: false|
|user_id|references|null: false, unique: true, index: true|
### Association
- belongs_to :user
- belongs_to_active_hash:prefecture_code


## credit_cardテーブル
|Column|Type|Options|
|------|----|-------|
|customer_id|string|null: false|
|card_id|string|null: false|
|user_id|references|null: false, unique: true, index: true|
### Association
- belongs_to :user


## booksテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|introduction|string|null: false|
|price|integer|null: false|
|category|string|null: false|
|publisher_code|integer|null: false|
|item_condition|integer|null: false|
|postage_payer|integer|null: false|
|preparation_day|integer|null: false|
|prefectuer_code|integer||
|buyer_id|integer||
|user_id|references|null: false, unique: true, index: true|
### Association
- belongs_to:user
- has_many:comments
- belongs_to_active_hash:publisher_code
- belongs_to_active_hash:postage_payer
- belongs_to_active_hash:preparation_day
- belongs_to_active_hash:prefecture_code


## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string||
### Association
- belongs_to :book


## item_imageテーブル
|Column|Type|Options|
|------|----|-------|
|image|text|null: false|
|book_id|string|null: false, unique: true, index: true|
### Association
- belongs_to :book


## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|comment|string|null: false|
|user_id|string|null: false, unique: true, index: true|
|book_id|string|null: false, unique: true, index: true|
### Association
- belongs_to :user
- belongs_to :book