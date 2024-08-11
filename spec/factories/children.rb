FactoryBot.define do
  factory :child do
    nickname { "TestNickname" }
    family_name { "山田" }
    first_name { "太郎" }
    family_name_kana { "ヤマダ" }
    first_name_kana { "タロウ" }
    gender { 'male' }
    birth_day { Date.new(2020, 1, 1) }
    association :user

    trait :with_image do
      after(:build) do |child|
        child.image.attach(io: File.open(Rails.root.join('spec', 'fixtures', 'files', 'test_image.png')), filename: 'test_image.png', content_type: 'image/png')
      end
    end
  end
end
