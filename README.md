# テーブル設計

## users テーブル

| Column     | Type       | Options      |
| --------   | ---------  | -------------|
| nickname   | string     | null: false  |
| name       | string     | null: false  |
| birthday   | date       | null: false  |
| email      | string     | null: false, |
| password   | string     | null: false, |

### Association

- has_many :items
- has_one :login
- has_one : address

## items テーブル

| Column       |  Type  | Options     |
| -----------  | ------ | ----------- |
| item_image   | string | null: false |
| item_name    | string | null: false |
| item_detail  | string | null: false |
| item_category| string | null: false |
| condition    | string | null: false |
| postage      | string | null: false |
| prefecture   | string | null: false |
| delivery     | string | null: false |
| price        | string | null: false |

### Association

- has_one :user
- has_one :address

## login テーブル

| Column   | Type       | Options                        |
| ------   | ---------- | ------------------------------ |
| user_id  | references | null: false, foreign_key: true |


### Association

- belongs_to :user


## address テーブル

| Column           | Type       | Options                        |
| --------------   | ---------- | --------------------------     |
| postal_code      | string     | null: false                    |
| prefecture_id    | date       | null: false                    |
| city             | string     | null: false                    |
| house_number     | string     | null: false                    |
| building_name    | string     |                                |
| telephone_number | string     | null: false                    |


### Association

- belongs_to :items
- belongs_to :users

##  buyテーブル

| user_id          | references | null: false, foreign_key: true |
| item_id          | references | null: false, foreign_key: true |
| address_id       | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- belongs_to :address

