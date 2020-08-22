FactoryBot.define do
  factory :item do
    name { '花' }
    detail { '可愛い花です' }
    category_id { '1' }
    condition_id { '1' }
    postage_id { '1' }
    prefecture_id { '1' }
    delivery_id  { '1' } 
    price { '10000' }  
    user
    after(:build) { |item| item.image.attach(io: File.open(Rails.root.join('public', 'test.png')), filename: 'test.png', content_type: 'image/jpg') }
  end
end
