# README

# テーブル設計

## users テーブル

| Column             | Type     | Options                   |
| ------------------ | -------- | ------------------------- |
| name               | string   | null: false               |
| email              | string   | null: false, unique: true |
| encrypted_password | string   | null: false               |

### Association


## items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| name            | string     | null: false                    |
| price           | integer    | null: false                    |
| collection      | references | null: false, foreign_key: true |
| category        | references | null: false, foreign_key: true |
| opal_color      | references | null: false, foreign_key: true |
| position        | integer    | null: false                    |


### Association

- has_one_attached :image
- has_many :item_parts
- has_many :item_glasses
- belongs_to :collection
- belongs_to :category
- belongs_to :opal_color


## item_parts テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| item   | references | null: false, foreign_key: true |
| part   | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :part


## parts テーブル

| Column   | Type       | Options     |
| -------- | ---------- | ----------- |
| name     | string     | null: false |
| material | string     | null: false |
| position | integer    | null: false |


### Association

- has_many :item_parts


## item_glasses テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| item    | references | null: false, foreign_key: true |
| glass   | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :glass


## glasses テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| name          | string     | null: false                    |
| opal_color    | references | foreign_key: true              |
| position      | integer    | null: false                    |


### Association

- has_many :item_grasses
- belong_to :opal_color 


## collections テーブル

| Column        | Type       | Options     |
| ------------- | ---------- | ----------- |
| name          | string     | null: false |
| position      | integer    | null: false |

### Association

- has_many :items


## categories テーブル

| Column        | Type       | Options     |
| ------------- | ---------- | ----------- |
| name          | string     | null: false |
| position      | integer    | null: false |

### Association

- has_many :items


## opal_colors テーブル

| Column        | Type       | Options     |
| ------------- | ---------- | ----------- |
| color         | string     | null: false |
| position      | integer    | null: false |

### Association

- has_many :items
- has_many :glasses