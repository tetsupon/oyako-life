class CreateMeals < ActiveRecord::Migration[7.0]
  def change
    create_table :meals do |t|
      t.references :child, null: false, foreign_key: true  # 子供のID
      t.datetime :meal_date, null: false                   # 食事の日付・時間
      t.string :meal_type_id, null: false                  # 食事の種類
      t.string :meal_name, null: false                     # 食品名
      t.float :quantity                                    # 食品の摂取量
      t.text :description                                  # 食事の詳細説明
      
      t.timestamps
    end
  end
end
