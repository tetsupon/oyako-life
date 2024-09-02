FactoryBot.define do
  factory :event do
    record_date { Faker::Date.backward(days: 14) }
    event_type_id { 1 } # ActiveHashで定義されている有効なIDを指定
    description { "Sample event description" }
    association :child

  end
end
