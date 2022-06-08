FactoryBot.define do
  factory :user do
    gimei = Gimei.name

    nickname{Faker::Name.name}
    email {Faker::Internet.free_email}
    password {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name{gimei.last.kanji}
    last_name{gimei.first.kanji}
    first_name_kana{gimei.last.katakana}
    last_name_kana{gimei.first.katakana}
    birthday{Faker::Date.between(from: '1930-01-01', to: '2017-12-31') }
  end
end