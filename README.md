# テーブル設計

## users テーブル

| Column     | Type   | Options     |
| --------   | ------ | ----------- |
| nickname   | string | null: false |
| email      | string | null: false |
| password   | string | null: false |
| name       | string | null: false |
| birthday   | string | null: false |

### Association

- has_many :items
- has_one :login
- has_one : buy

## items テーブル

| Column       |  Type   | Options    |
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
- has_one :buy

## login テーブル

| Column   | Type       | Options                        |
| ------   | ---------- | ------------------------------ |
| email    | references | null: false, foreign_key: true |
| password | references | null: false, foreign_key: true |
| user_id  | references | null: false, foreign_key: true |

### Association

- belongs_to :user


## buys テーブル

| Column           | Type       | Options                        |
| --------------   | ---------- | --------------------------     |
| postal_code      | string     | null: false                    |
| prefecture       | string     | null: false                    |
| city             | string     | null: false                    |
| house_number     | string     | null: false                    |
| building_name    | string     | null: false                    |
| telephone_number | string     | null: false                    |
| user_id          | references | null: false, foreign_key: true |
| item_id          | references | null: false, foreign_key: true |

### Association

- belongs_to :items
- belongs_to :users
