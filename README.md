# README

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