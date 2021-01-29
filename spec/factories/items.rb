FactoryBot.define do
  factory :item do
    name              { 'test' }
    description       { 'test' }
    category_id       { 2 }
    state_id          { 2 }
    shipping_fee_id   { 2 }
    area_id           { 2 }
    shipping_date_id { 2 }
    price { 5000 }
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
