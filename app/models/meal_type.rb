class MealType < ActiveHash::Base
  self.data = [
    { id: 1, name: '朝食' },
    { id: 2, name: '昼食' },
    { id: 3, name: '夕食' },
    { id: 4, name: 'おやつ' }
  ]

  include ActiveHash::Associations
  has_many :meals
end