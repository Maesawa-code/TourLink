FactoryBot.define do
  factory :user do
    nickname { Faker::Internet.username }
    email { Faker::Internet.unique.email }
    password { 'password1' }
    password_confirmation { 'password1' }
    gender_id { 2 }
    age_group_id { 2 }

    after(:build) do |user|
      user.profile_image.attach(
        io: File.open(Rails.root.join('public/images/test_image.png')),
        filename: 'test_image.png',
        content_type: 'image/png'
      )
    end
  end
end
