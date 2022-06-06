# テーブル設計

## User

|column             |type    |Options                  |
|-------------------|--------|-------------------------|
|id                 |integer |null: false              |
|email              |string  |null: false              |
|first_name         |string  |null: false              |
|first_name_kana    |string  |null: false              |
|last_name          |string  |null: false              |
|last_name_kana     |string  |null: false              |
|password           |string  |null: false              |
|confirmed_password |string  |null: false              |
|birthday           |datetime|null: false              |

### Association
has_many :goods
has_many :matches
has_one :buyer_address

## goods

|column            |type           |Options                  |
|------------------|----------|------------------------------|
|id                |integer   |null: false                   |
|name              |string    |null: false                   |
|description       |text      |null: false                   |
|image             |----------|activestorageを利用            |
|category          |string    |null: false                   |
|condition         |string    |null: false                   |
|delivery_cost_user|references|null: false, foreign_key: true|
|prefecture        |string    |null: false                   |
|delivery_day      |string    |null: false                   |
|price             |integer   |null: false                   |
|seller_user_id    |references|null: false, foreign_key: true|

### Association
belongs_to:user
belongs_to:match

## match

|column        |type      |Options                       |
|--------------|----------|------------------------------|
|id            |integer   |null: false                   |
|seller_user_id|references|null: false, foreign_key: true|
|buyer_user_id |references|null: false, foreign_key: true|
|good_id       |references|null: false, foreign_key: true|

### Association
belongs_to:goods
belongs_to:user
has_one:buyer_address

## buyer_address

|column        |type      |Options                       |
|--------------|----------|------------------------------|
|id            |integer   |null: false                   |
|address_number|integer   |null: false                   |
|prefecture    |string    |null: false                   |
|city          |string    |null: false                   |
|banti         |string    |null: false                   |
|building_name |string    |                              |
|phone_number  |integer   |null: false                   |
|buyer_user_id |references|null: false, foreign_key: true|

### Association
belongs_to:match