class CreateChildren < ActiveRecord::Migration[7.0]
  def change
    create_table :children do |t|
      t.references :user,           null: false, foreign_key: true
      t.string :nickname,           null: false
      t.string :family_name,        null: false
      t.string :first_name,         null: false
      t.string :family_name_kana,   null: false
      t.string :first_name_kana,    null: false
      t.string :gender,             null:false
      t.date :birth_day,            null:false

      t.timestamps
    end
  end
end
