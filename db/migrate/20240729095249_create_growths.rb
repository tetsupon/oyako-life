class CreateGrowths < ActiveRecord::Migration[7.0]
  def change
    create_table :growths do |t|
      t.references :child, null: false, foreign_key: true
      t.date :record_date, null: false
      t.string :growth_type_id, null: false
      t.float :height, null: false
      t.float :weight, null: false
      t.text :description
      
      t.timestamps
    end
  end
end
