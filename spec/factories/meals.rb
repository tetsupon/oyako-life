FactoryBot.define do
  factory :meal do
    meal_date { Faker::Date.backward(days: 14) }
    meal_type_id { 1 }
    meal_name { "おかゆ" }
    association :child
  end
end

