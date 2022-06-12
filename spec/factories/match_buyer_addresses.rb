FactoryBot.define do
  factory :match_buyer_address do
    address = Gimei.address

    address_number{Faker::Number.number(digits: 3).to_s + "-" + Faker::Number.number(digits: 4).to_s}
    city{address.city.kanji}
    banti{address.town.kanji}
    building_name{Faker::Lorem.sentence}
    phone_number{Faker::Number.number(digits: 11)}
    prefecture_id{Faker::Number.between(from: 2, to: 48)}
    token{"tok_abcdefghijk00000000000000000"}
  end
end
