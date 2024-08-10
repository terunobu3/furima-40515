FactoryBot.define do
  factory :user_order do
    token           { 'tok_abcdefghijk00000000000000000' }
    postcode        { '123-4567' }
    prefecture_id   { Faker::Number.within(range: 1..47) }
    city            { '新潟市旭区' }
    block           { '二俣川1ー1ー1' }
    building        { '八重洲ビル' }
    phone_number    { Faker::Number.leading_zero_number(digits: 11) }
  end
end