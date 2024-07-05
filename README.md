
# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

## usersテーブル
| Column               | Type   | Option      | 
| -------------------- | ------ | ----------- | 
| nickname             | string | null: false | 
| email                | string | null: false unique: true| 
| encrypted_password   | string | null: false | 
| last_name            | string | null: false | 
| first_name           | string | null: false |
| last_name_kana       | string | null: false |
| first_name_kana      | string | null: false | 
| birthday             | date   | null: false | 

### Association
- has_many :items
- has_many :comments
- has_many :orders

## itemsテーブル
| Column           | Type       | Option      | 
| ---------------- | ---------- | ----------- |  
| item_name        | string     | null: false | 
| item_text        | text       | null: false | 
| category_id      | integer    | null: false | 
| status_id        | integer    | null: false | 
| delivery_id      | integer    | null: false | 
| prefecture_id    | integer    | null: false | 
| delivery_day_id  | integer    | null: false | 
| price            | integer    | null: false | 
| user             | references | null: false foreign_key: true  | 

### Association
- has_many :comments
- belongs_to :user
- has_one :order

## ordersテーブル
| Column  | Type       | Option            | 
| ------- | ---------- | ----------------- | 
| user | references | null: false foreign_key: true | 
| item | references | null: false foreign_key: true | 

### Association
- belongs_to :item
- belongs_to :user
- has_one :address

## addressesテーブル
| Column        | Type       | Option      | 
| ------------- | ---------- | ----------- | 
| postcode      | string     | null: false | 
| prefecture_id | integer    | null: false | 
| city          | string     | null: false | 
| block         | string     | null: false | 
| building      | string     |             | 
| phone_number  | string     | null: false | 
| order         | references | null: false foreign_key: true | 

### Association
- belongs_to :order

## commentsテーブル
| Column  | Type       | Option            | 
| ------- | ---------- | ----------------- | 
| text    | string     | null: false       | 
| user    | references | foreign_key: true | 
| item    | references | foreign_key: true | 

### Association
- belongs_to :user
- belongs_to :item
