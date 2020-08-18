FactoryBot.define do
  factory :user do
    last_name { '鈴木' }
    first_name { '一郎' }
    last_name_kana { 'スズキ' }
    first_name_kana { 'イチロウ' }
    nickname { 'suzuki' }
    email { 'test@test.test' }
    password { "test1234" } 
    birthday { '1990-01-01' }   
  end
end
