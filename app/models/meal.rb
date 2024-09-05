class Meal < ApplicationRecord
  belongs_to :child

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :meal_type


  with_options presence: true do
    validates :meal_date
    validates :meal_type_id, numericality: { other_than: 0, message: 'は0以外の値にしてください' }
    validates :meal_name
  end
end
