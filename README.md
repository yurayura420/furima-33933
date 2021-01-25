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

|Column            |Type  |Options                |
|------------------|------|-----------------------|
|nickname          |string|null:false             |
|email             |string|null:false unique: true|
|encrypted_password|string|null:false             |
|firstname         |string|null:false             |
|lastname          |string|null:false             |
|firstname_read    |string|null:false             |
|lastname_read     |string|null:false             | 
|birth_date        |date  |null:false             |

### Association
- has_many :items
- has_many :buyrecords


## items

|Column          |Type      |Options                      |
|----------------|----------|-----------------------------|
|name            |string    |null:false                   |
|description     |text      |null:false                   |
|status          |integer   |null:false                   |
|shippingfee     |integer   |null:false                   | 
|area            |integer   |null:false                   |
|shippingdate    |integer   |null:false                   |
|price           |integer   |null:false (300~9999999)     |
|user(producer)  |references|null:false, foreign_key: true|

### Association
- belongs_to :user
- has_one :buyrecord


## buyrecords

|Column         |Type      |Options                      |
|---------------|----------|-----------------------------|
|user(purchaser)|references|null:false, foreign_key: true|
|items          |references|null:false, foreign_key: true|


### Association
- belongs_to :user
- belongs_to :item
- has_one :addresses

## addresses

|Column     |Type      |Options                      |
|-----------|----------|-----------------------------|
|area       |string    |null:false                   |
|city       |string    |null:false                   |
|housenumber|string    |null:false                   |
|housename  |string    |null:false                   |
|phonenumber|string    |null:false                   |
|buyrecords |references|null:false, foreign_key: true|

### Association
- belongs_to :buyrecord

