# テーブル設計

## users テーブル

| Column          | Type       | Options      |
| ------------    | ---------  | -------------|
| nickname        | string     | null: false  |
| last_name       | string     | null: false  |
| first_name      | string     | null: false  |
| last_name_kana  | string     | null: false  |
| first_name_kana | string     | null: false  |
| birthday_id     | integer    | null: false  |
| email           | string     | null: false, |
| password        | string     | null: false, |

### Association

- has_many :items
- has_one : address
- belongs_to :buy

## items テーブル

| Column           |  Type      | Options                        |
| --------------   | ------     | ---------------------          |
| image            | string     | null: false                    |
| name             | string     | null: false                    |
| item_detail      | text       | null: false                    |
| category_id      | integer    | null: false                    |
| condition_id     | integer    | null: false                    |
| postage_id       | integer    | null: false                    |
| prefecture_id    | integer    | null: false                    |
| delivery_id      | integer    | null: false                    |
| price            | integer    | null: false                    |
| user_id          | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_one :address
- belongs_to :buy



## address テーブル

| Column           | Type       | Options                        |
| --------------   | ---------- | --------------------------     |
| postal_code      | string     | null: false                    |
| prefecture_id    | integer    | null: false                    |
| city             | string     | null: false                    |
| house_number     | string     | null: false                    |
| building_name    | string     |                                |
| telephone_number | string     | null: false                    |
| item_id          | references | null: false, foreign_key: true |
| user_id          | references | null: false, foreign_key: true |



### Association

- belongs_to :buy
- belongs_to :item


##  buyテーブル

| user_id          | references | null: false, foreign_key: true |
| item_id          | references | null: false, foreign_key: true |
| address_id       | references | null: false, foreign_key: true |

### Association

- has_one :address
- has_one :item
- has_one :user


