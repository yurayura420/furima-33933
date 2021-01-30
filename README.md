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

* ...

## users

|Column             |Type  |Options                |
|-------------------|------|-----------------------|
|nickname           |string|null:false             |
|email              |string|null:false unique: true|
|encrypted_password |string|null:false             |
|first_name         |string|null:false             |
|last_name          |string|null:false             |
|first_name_read    |string|null:false             |
|last_name_read     |string|null:false             | 
|birth_date         |date  |null:false             |

### Association
- has_many :items
- has_many :orders


## items

|Column           |Type      |Options                      |
|-----------------|----------|-----------------------------|
|name             |string    |null:false                   |
|description      |text      |null:false                   |
|state_id         |integer   |null:false                   |
|shipping_fee_id  |integer   |null:false                   | 
|area_id          |integer   |null:false                   |
|shipping_date_id |integer   |null:false                   |
|category_id      |integer   |null:false                   |
|price            |integer   |null:false (300~9999999)     |
|user(producer)   |references|null:false, foreign_key: true|

### Association
- belongs_to :user
- has_one :order


## orders

|Column         |Type      |Options                      |
|---------------|----------|-----------------------------|
|user(purchaser)|references|null:false, foreign_key: true|
|item           |references|null:false, foreign_key: true|


### Association
- belongs_to :user
- belongs_to :item
- has_one :address

## addresses

|Column      |Type      |Options                      |
|--------------|----------|-----------------------------|
|address_number|string    |null:false                   |
|area_id       |integer   |null:false                   |
|city          |string    |null:false                   |
|house_number  |string    |null:false                   |
|house_name    |string    |                             |
|phone_number  |string    |null:false                   |
｜order    |references|null:false, foreign_key: true|

### Association
- belongs_to :order

