FactoryBot.define do
  factory :good do
      name {Faker::Lorem.sentence}
      description {Faker::Lorem.sentence}
      price {Faker::Number.between(from: 300, to: 9999999)}
      category_id{Faker::Number.between(from: 2, to: 11)}
      condition_id{Faker::Number.between(from: 2, to: 7)}
      delivery_load_id{Faker::Number.between(from: 2, to: 3)}
      delivery_day_id{Faker::Number.between(from: 2, to: 4)}
      prefecture_id{Faker::Number.between(from: 2, to: 48)}

      association :user

      after(:build) do |good|
      good.image.attach(io: File.open('public/images/test_image.png'),
       filename: 'test_image.png', content_type: 'image/png')
      end
  end
end
