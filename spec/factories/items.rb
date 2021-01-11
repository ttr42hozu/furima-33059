FactoryBot.define do
  factory :item do
    image { Faker::File.file_name }
    title { Faker::Games::Pokemon.name}
    description { Faker::Games::Pokemon.name}
    category_id { Faker::Number.within(range: 2..11)}
    status_id { Faker::Number.within(range: 2..7)}
    shipping_charge_id { Faker::Number.within(range: 2..3)}
    ship_to_area_id { Faker::Number.within(range: 2..48)}
    ship_to_day_id { Faker::Number.within(range: 2..4)}
    price { Faker::Number.within(range: 300..9999999)}
    user_id { Faker::Number.within(range: 1..9999999)}
  end
end
