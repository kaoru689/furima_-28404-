FactoryBot.define do
  factory :buys_address do
    postal_code { '123-4567' }
    prefecture_id { '1' }
    city { '東京都港区南麻布' }
    house_number { '1-11-11' }
    building_name { '森ビル' }
    telephone_number { '09012345678' }
  end
end
