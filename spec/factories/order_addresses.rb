FactoryBot.define do
  factory :order_address do
    postcode { '215-0021' }
    ship_to_area_id { Faker::Number.within(range: 2..48) }
    city { '神奈川県川崎市幸区' }
    block { '木月3-18-10' }
    phone_number { 12_345_678_901 }
    token { 'sk_test_a1a1a1a1a1a1a1a1a1a1' }
    user_id { 1 }
    item_id { 1 }
  end
end
