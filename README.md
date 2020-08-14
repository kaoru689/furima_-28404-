# テーブル設計

## users テーブル

| Column          | Type       | Options      |
| ------------    | ---------  | -------------|
| nickname        | string     | null: false  |
| last_name       | string     | null: false  |
| first_name      | string     | null: false  |
| last_name_kana  | string     | null: false  |
| first_name_kana | string     | null: false  |
| birthday        | date       | null: false  |
| email           | string     | null: false, |
| password        | string     | null: false, |

### Association

- has_many :items
- has_many :buy

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
| user             | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_one :address




## address テーブル

| Column           | Type       | Options                        |
| --------------   | ---------- | --------------------------     |
| postal_code      | string     | null: false                    |
| prefecture_id    | integer    | null: false                    |
| city             | string     | null: false                    |
| house_number     | string     | null: false                    |
| building_name    | string     |                                |
| telephone_number | string     | null: false                    |
| buy              | references | null: false, foreign_key: true |





##  buyテーブル

| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |


### Association

- belongs_to :item
- belongs_to :user


