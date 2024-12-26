FactoryBot.define do
  factory :review do
    association :user
    title { Faker::Lorem.sentence(word_count: 3) }
    rating { Faker::Number.between(from: 1, to: 5) }
    comment { Faker::Lorem.sentence(word_count: 10) }
    image { Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/test_image.png'), 'image/png') }
  end
end
