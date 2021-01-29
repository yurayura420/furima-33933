FactoryBot.define do
  factory :order_address do
    address_number    { '123-4567' }
    area_id           { 1 }
    city              { 'a' }
    house_number      { 'a' }
    house_name        { 'a' }
    phone_number      { '00000000000' }
    token             { 'tok_abcdefghijk00000000000000000' }
  end
end
