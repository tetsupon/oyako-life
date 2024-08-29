class Meal < ApplicationRecord
  belongs_to :child

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :meal_type
end
