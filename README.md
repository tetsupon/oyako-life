# README


# 親子Life

## アプリケーション名
親子Life

## アプリケーション概要
「親子Life」は、子育てに役立つ情報を一元管理できるアプリケーションです。子供の成長記録、イベント、予防接種、健康診断、食事管理など、日常の子育てに必要な情報を簡単に記録・閲覧できる機能を提供します。

## URL
デプロイ済みのURL: [https://oyako-life.onrender.com/]

## テスト用アカウント
- **Basic認証**
  - **ID**: `tetsu`
  - **Password**: `0305`

## 利用方法
1. アカウント新規登録またはログインを行います。
2. 子供の情報を登録します。
3. 成長記録、イベント、予防接種、健康診断、食事管理などの情報を追加します。
4. 各種記録を確認したり、編集・削除したりすることができます。

## アプリケーションを作成した背景
現代の忙しい親たちは、子供の成長や健康管理を効率的に行う必要がありますが、情報の管理が分散してしまうことが多く、煩雑さを感じることがあります。このアプリケーションは、そうした問題を解決し、親が安心して子育てに集中できるように支援することを目的としています。

## 実装した機能についての画像やGIFおよびその説明
- **成長記録機能**
  - 子供の身長や体重を記録・グラフ化して表示。
  - ![成長記録機能](画像URL)

- **イベント管理機能**
  - 子供の重要なイベントや出来事を記録。
  - ![イベント管理機能](画像URL)

- **予防接種管理機能**
  - 予防接種のスケジュールを管理。
  - ![予防接種管理機能](画像URL)

- **健康診断管理機能**
  - 健康診断の結果を記録・管理。
  - ![健康診断管理機能](画像URL)

- **食事管理機能**
  - 子供の食事内容を記録し、栄養管理をサポート。
  - ![食事管理機能](画像URL)

## 実装予定の機能
- **AIを活用した育児アドバイス機能**
- **他の保護者との情報共有機能**
- **通知機能**（予防接種や健康診断のリマインダー）

## データベース設計
- ![ER図を添付](ER図の画像URL)

## 画面遷移図
- ![画面遷移図を添付](画面遷移図の画像URL)

## 開発環境
- **言語**: Ruby 3.2.0
- **フレームワーク**: Ruby on Rails7.0.0
- **データベース**: PostgreSQL
- **フロントエンド**: HTML, CSS, JavaScript
- **認証**: Devise
- **テスト**: RSpec
- **デプロイ**: Render

## ローカルでの動作方法
1. リポジトリをクローンします。
   ```bash
   git clone https://github.com/your_username/oyako-life.git


### 1. ユーザー管理機能

#### usersテーブル（親の情報）
| Column              | Type      | Options                   | 説明                      |
|---------------------|-----------|---------------------------|--------------------------|
| nickname            | string    | null: false               | ニックネーム               |
| email               | string    | null: false, unique: true | メールアドレス              |
| encrypted_password  | string    | null: false               | 暗号化されたパスワード       |
| family_name         | string    | null: false               | 名字                     |
| first_name          | string    | null: false               | 名前                     |
| family_name_kana    | string    | null: false               | 名字（カナ）             |
| first_name_kana     | string    | null: false               | 名前（カナ）             |
| birth_day           | date      | null: false               | 生年月日                 |
| gender              | string    | null: false               | 性別                     |

### Association
- `has_many :childrens`

### 2. 育児記録機能

#### childrenテーブル（子供の情報）
| Column              | Type      | Options                        | 説明                     |
|---------------------|-----------|--------------------------------|--------------------------|
| user_id             | references| null: false, foreign_key: true | 親のID             |
| nickname            | string    | null: false                    | ニックネーム             |
| family_name         | string    | null: false                    | 名字                     |
| first_name          | string    | null: false                    | 名前                     |
| family_name_kana    | string    | null: false                    | 名字（カナ）             |
| first_name_kana     | string    | null: false                    | 名前（カナ）             |
| birth_day           | date      | null: false                    | 生年月日                 |
| gender              | string    | null: false                    | 性別                     |

### Association
- `belongs_to :user`
- `has_many :growth_records`
- `has_many :event_records`
- `has_many :vaccination_records`
- `has_many :health_checkup_records`
- `has_many :meal_records`


#### growthsテーブル（成長記録）
| Column              | Type      | Options                        | 説明                     |
|---------------------|-----------|--------------------------------|--------------------------|
| child_id            | references| null: false, foreign_key: true | 子供のID                  |
| record_date         | date      | null: false                    | 成長記録の日付            |
| growth_type_id      | string    | null: false                    | 成長の種類（プルダウン表示）|
| height              | float     | null: false                    | 身長                     |
| weight              | float     | null: false                    | 体重                     |
| description         | text      |                                | 成長の詳細説明                     |

### Association
- `belongs_to :child`

#### eventsテーブル（出来事記録）
|  Column             | Type      | Options                        | 説明                     |
|---------------------|-----------|--------------------------------|--------------------------|
| child_id            | references| null: false, foreign_key: true | 子供のID             |
| record_date         | date      | null: false                    | 出来事の日付            |
| event_type_id       | string    | null: false                    | 出来事の種類（プルダウン表示） |
| description         | text      |                                | 出来事の詳細説明          |

### Association
- `belongs_to :child`

### 3. 健康管理機能

#### vaccinationsテーブル（予防接種）
|  Column             | Type      | Options                        | 説明                     |
|---------------------|-----------|--------------------------------|--------------------------|
| child_id            | references| null: false, foreign_key: true | 子供のID             |
| vaccination_name    | string    | null: false                    | 予防接種の名前           |
| scheduled_date      | datetime  | null: false                    | 接種予定日・時間        |
| administered_date   | date      | null: false                    | 接種実施日              |
| administered_by     | string    |                                | 実施者（医師名）         |
| description         | text      |                                | 予防接種の詳細説明        |

### Association
- `belongs_to :child`

#### health_checksテーブル（健康診断記録）
|  Column             | Type      | Options                        | 説明                     |
|---------------------|-----------|--------------------------------|--------------------------|
| child_id            | references| null: false, foreign_key: true | 子供のID                 |
| checkup_name        | string    | null: false                    | 健康診断の名前              |
| scheduled_date      | datetime  | null: false                    | 健康診断予定日・時間         |
| administered_date   | date      | null: false                    | 健康診断実施日              |
| doctor_name         | string    |                                | 実施者（担当医師名）         |
| description         | text      |                                | 健康診断の詳細説明           |

### Association
- `belongs_to :child`

### 4. 食事管理機能

#### mealsテーブル（食事記録）
|  Column             | Type      | Options                        | 説明                     |
|---------------------|-----------|--------------------------------|--------------------------|
| child_id            | references| null: false, foreign_key: true | 子供のID             |
| meal_date           | datetime  | null: false                    | 食事の日付・時間             |
| meal_type_id        | string    | null: false                    | 食事の種類               |
| meal_name           | string    | null: false                    | 食品名                   |
| quantity            | float     |                                | 食品の摂取量             |
| description         | text      |                                | 食事の詳細説明            |

### Association
- `belongs_to :child`