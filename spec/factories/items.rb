FactoryBot.define do
  factory :item do
    title { Faker::Games::Pokemon.name }
    description { Faker::Games::Pokemon.name }
    category_id { Faker::Number.within(range: 2..11) }
    status_id { Faker::Number.within(range: 2..7) }
    shipping_charge_id { Faker::Number.within(range: 2..3) }
    ship_to_area_id { Faker::Number.within(range: 2..48) }
    ship_to_day_id { Faker::Number.within(range: 2..4) }
    price { Faker::Number.within(range: 300..9_999_999) }
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
