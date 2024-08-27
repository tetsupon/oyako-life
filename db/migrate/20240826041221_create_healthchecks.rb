class CreateHealthchecks < ActiveRecord::Migration[7.0]
  def change
    create_table :healthchecks do |t|
      t.references :child, null: false, foreign_key: true
      t.string :checkup_name, null: false
      t.datetime :scheduled_date, null: false
      t.date :administered_date, null: false
      t.string :doctor_name
      t.text :description
      t.timestamps
    end
  end
end
