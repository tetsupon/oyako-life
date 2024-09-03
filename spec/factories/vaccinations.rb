FactoryBot.define do
  factory :vaccination do
    vaccination_name { 'BCG' }
    scheduled_date   { Faker::Date.forward(days: 23) }
    administered_date { Faker::Date.backward(days: 2) }
  end
end
