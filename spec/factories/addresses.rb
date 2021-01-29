FactoryBot.define do
  factory :address do
    address_number    { '123-4567' }
    area_id           { 1 }
    city              { "a" }
    house_number      { "a" }
    house_name        { "a" }
    phone_number      { 00000000000 }
    user_id           { 2 }
    item_id           { 1 }
  end
end
