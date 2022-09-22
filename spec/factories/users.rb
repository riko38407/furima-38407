FactoryBot.define do
  factory :user do
    nickname { Faker::Name.name }
    email { Faker::Internet.unique.email }
    password { '1a' + Faker::Internet.unique.password(min_length: 6) }
    password_confirmation { password }
    last_name { '山田' }
    first_name { '陸太郎' }
    first_kana { 'ヤマダ' }
    last_kana { 'リクタロウ' }
    birthday { Faker::Date.birthday }
  end
end