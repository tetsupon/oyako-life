class CreateHealthchecks < ActiveRecord::Migration[7.0]
  def change
    create_table :healthchecks do |t|

      t.timestamps
    end
  end
end
