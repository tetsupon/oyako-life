class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.references :child, null: false, foreign_key: true  # 子供のIDを外部キーとして参照
      t.date :record_date, null: false                    # 出来事の日付
      t.string :event_type_id, null: false                # 出来事の種類（プルダウン表示）
      t.text :description                                 # 出来事の詳細説明
      
      t.timestamps
    end
  end
end