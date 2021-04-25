# README

# テーブル設計

## users テーブル

| Column             | Type     | Options                   |
| ------------------ | -------- | ------------------------- |
| company            | string   | null: false               |
| zip_code           | integer  | null: false               |
| prefecture_id      | integer  | null: false               |
| city               | string   | null: false               |
| address            | string   | null: false               |
| building           | string   |                           |
| phone_number       | integer  | null: false               |
| bank               | string   | null: false               |
| branch             | string   | null: false               |
| bank_type_id       | integer  | null: false               |
| bank_number        | integer  | null: false               |
| bank_account       | string   | null: false               |
| email              | string   | null: false, unique: true |
| encrypted_password | string   | null: false               |


### Association

- has_many clients


## clients テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| name             | string     | null: false                    |
| percentage       | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |


### Association

- belongs_to :user


## items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| name            | string     | null: false                    |
| price           | integer    | null: false                    |
| collection      | references | null: false, foreign_key: true |
| category        | references | null: false, foreign_key: true |
| opal_color      | references | null: false, foreign_key: true |
| chain_name      | string     | null: false, unique: true      |
| position        | integer    | null: false                    |


### Association

- has_one_attached :image
- has_many :item_parts
- has_many :item_glasses
- belongs_to :collection
- belongs_to :category
- belongs_to :opal_color
- has_one :stock




## item_parts テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| item     | references | null: false, foreign_key: true |
| part     | references | null: false, foreign_key: true |
| quantity | integer    | null: false                    |


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

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| item     | references | null: false, foreign_key: true |
| glass    | references | null: false, foreign_key: true |
| quantity | integer    | null: false                    |


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


## invoices テーブル

| Column            | Type       | Options     |
| ----------------- | ---------- | ----------- |
| issue_date        | date       | null: false |
| issue_number      | integer    | null: false |
| content           | string     |             |
| client_name       | string     | null: false |
| client_percentage | integer    | null: false |

### Association

- has_many :invoice_items


## invoice_items テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| invoice    | references | null: false, foreign_key: true |
| chain_item | string     | null: false                    |
| size       | string     |                                |
| price      | integer    | null: false                    |
| quantity   | integer    | null: false                    |

### Association

- belongs_to :invoice


## stocks テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| item       | references | null: false, foreign_key: true |
| quantity   | integer    | null: false                    |

### Association

- belongs_to :item
- has_many :inventories


## inventories テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| stock      | references | null: false, foreign_key: true |
| date       | date       | null: false                    |
| content    | string     |                                |
| quantity   | integer    | null: false                    |
| in_out     | integer    | null: false                    |

### Association

- belongs_to :item
- has_many :inventories