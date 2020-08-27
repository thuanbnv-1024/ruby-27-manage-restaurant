FactoryBot.define do
  factory :user do |f|
    f.name {Faker::Name.name}
    f.email {Faker::Internet.email}
    f.password {"123456"}
    f.password_confirmation {"123456"}
    f.address {"HN"}
    f.phone {12876541237}
    f.birthday {"2020-12-12"}
    f.role {"admin"}
    f.gender{"man"}
  end
end
