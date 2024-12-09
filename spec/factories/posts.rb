FactoryBot.define do
  factory :post do
    title { Faker::Lorem.sentence }
    scheduled_date { Faker::Date.forward(days: 10) }
    bike_genre_id { Faker::Number.between(from: 2, to: 10) }
    engine_capacity_id { Faker::Number.between(from: 2, to: 10) }
    prefecture_id { Faker::Number.between(from: 2, to: 47) }
    note { Faker::Lorem.characters(number: 50) }

    association :user
  end
end
