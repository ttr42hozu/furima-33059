FactoryBot.define do
  factory :user do
    nickname {Faker::Name.name}
    email {Faker::Internet.free_email}
    password {"a1"+ Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name {Gimei.first.kanji}
    last_name {Gimei.last.kanji}
    first_name_kana {Gimei.first.katakana}
    last_name_kana {Gimei.last.katakana}
    birthday {Faker::Date.birthday}
  end
end