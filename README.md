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

|Column    |Type  |Options                     |
|----------|------|----------------------------|
|nickname  |string|null:false                  |
|email     |string|null:false unique: true     |
|password  |string|null:false(半角英数混合)      |
|firstname |string|null:false(漢字カタカナ平仮名) |
|birth-date|string|null:false                  |

### Association
- has_many :items
- has_many :buyrecords


## items

|Column          |Type      |Options                      |
|----------------|----------|-----------------------------|
|name            |string    |null:false                   |
|description     |text      |null:false                   |
|status          |string    |null:false                   |
|shippingfee     |integer   |null:false                   | 
|area            |string    |null:false                   |
|shippingdate    |string    |null:false                   |
|price           |integer   |null:false (300~9999999)     |
|user(producer)  |references|null:false, foreign_key: true|

### Association
- belongs_to :user
- has_one :buyrecord


## buyrecords

|Column         |Type      |Options                      |
|---------------|----------|-----------------------------|
|name           |string    |null:false                   |
|user(purchaser)|references|null:false, foreign_key: true|
|items          |references|null:false, foreign_key: true|


### Association
- belongs_to :user
- belongs_to :item

## addresses

|Column     |Type      |Options                      |
|-----------|----------|-----------------------------|
|prefecture |string    |null:false                   |
|city       |string    |null:false                   |
|housenumber|string    |null:false                   |
|phonenumber|string    |null:false                   |
|buyrecords |references|null:false, foreign_key: true|

### Association
- belongs_to :buyrecord

