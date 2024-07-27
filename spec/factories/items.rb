FactoryBot.define do
  factory :item do
    association :user
    
    name            { '商品名' }
    text            { '商品説明' }
    price           { 1000 }
    category_id     { Faker::Number.within(range:1..10) }
    status_id       { Faker::Number.within(range: 1..6) }
    delivery_id     { Faker::Number.within(range: 1..2) }
    prefecture_id   { Faker::Number.within(range: 1..47) }
    delivery_days_id { Faker::Number.within(range: 1..3) }
  
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    
    end
  end
end