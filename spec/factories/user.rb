FactoryBot.define do
  factory :user do |f|
    f.name {Faker::Name.name}
    f.email {Faker::Internet.email}
    f.password {"abc456"}
    f.password_confirmation {"abc456"}
    f.address {Faker::Address.city}
    f.phone {1234567891}
    f.birthday {Faker::Date.birthday}
    f.role {"customer"}
  end
end
