FactoryBot.define do
  factory :growth do
    association :child
    
    record_date { Date.today }
    growth_type_id { 1 }
    height { 50.5 }
    weight { 3.5 }
    
  end
end
