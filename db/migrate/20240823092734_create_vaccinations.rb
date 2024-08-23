class CreateVaccinations < ActiveRecord::Migration[7.0]
  def change
    create_table :vaccinations do |t|
      t.references :child, null: false, foreign_key: true  # 子供のID
      t.string :vaccination_name, null: false              # 予防接種の名前
      t.datetime :scheduled_date, null: false              # 接種予定日・時間
      t.date :administered_date, null: false               # 接種実施日
      t.string :administered_by                            # 実施者（医師名）
      t.text :description                                  # 予防接種の詳細説明

      t.timestamps
    end
  end
end
