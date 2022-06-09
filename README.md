# テーブル設計

## Users

|column             |type    |Options                  |
|-------------------|--------|-------------------------|
|id                 |integer |null: false              |
|email              |string  |null: false, unique: true|
|first_name         |string  |null: false              |
|first_name_kana    |string  |null: false              |
|last_name          |string  |null: false              |
|last_name_kana     |string  |null: false              |
|encrypted_password |string  |null: false              |
|nickname           |string  |null: false              |
|birthday           |date    |null: false              |

### Association
has_many :goods
has_many :matches

## goods

|column            |type           |Options                  |
|------------------|----------|------------------------------|
|id                |integer   |null: false                   |
|name              |string    |null: false                   |
|description       |text      |null: false                   |
|image             |----------|                              | activestorageを利用 
|category_id       |integer   |null: false                   | active_hash
|condition_id      |integer   |null: false                   | active_hash
|delivery_load_id  |integer   |null: false                   | active_hash
|prefecture_id     |integer   |null: false                   | active_hash
|delivery_day_id   |integer   |null: false                   | active_hash
|price             |integer   |null: false                   |
|user              |references|null: false, foreign_key: true|←販売者

### Association
belongs_to:user
has_one:match

## matches

|column        |type      |Options                       |
|--------------|----------|------------------------------|
|id            |integer   |null: false                   |
|user          |references|null: false, foreign_key: true|←購入者
|good          |references|null: false, foreign_key: true|

### Association
belongs_to:good
belongs_to:user
has_one:buyer_address

## buyer_addresses

|column        |type      |Options                       |
|--------------|----------|------------------------------|
|id            |integer   |null: false                   |
|address_number|string    |null: false                   |
|prefecture_id |integer   |null: false                   | active_hash
|city          |string    |null: false                   |
|banti         |string    |null: false                   |
|building_name |string    |                              |
|phone_number  |string    |null: false                   |
|match         |references|null: false, foreign_key: true|

### Association
belongs_to:match