FactoryBot.define do
  factory :user do
    nickname { Faker::Name.name }
    email { Faker::Internet.unique.email }
    password { '1a' + Faker::Internet.unique.password(min_length: 6) }
    password_confirmation { password }
    family_name { "山田" }
    first_name { "太郎" }
    family_name_kana { "ヤマダ" }
    first_name_kana { "タロウ" }
    gender { "male" }
    birth_day { "1990-01-01" }
  end
end