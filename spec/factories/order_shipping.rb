FactoryBot.define do
  factory :order_shipping do
    post_code {"#{Faker::Number.number(digits: 3)}-#{Faker::Number.number(digits: 4)}"}
    prefecture_id{Faker::Number.between(from: 1, to: 47)}
    city {Faker::Address.city}
    address {Faker::Address.street_address}
    building_name {Faker::Address.secondary_address}
    phone_number {Faker::Number.leading_zero_number(digits: rand(10..11))}
  end
end