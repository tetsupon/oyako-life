FactoryBot.define do
  FactoryBot.define do
    factory :healthcheck do
      checkup_name { "定期健康診断" }
      scheduled_date { Date.today }
      doctor_name { "山田 太郎" }
      description { "特に異常はありませんでした。" }
      association :child
    end
  end
  
end
