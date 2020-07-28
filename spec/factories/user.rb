FactoryBot.define do
  factory :user do
    name {Faker::Name.name}
    email {Faker::Internet.email}
    phone {Settings.phone}
    address {Faker::Address.full_address}
    password {Settings.role.default_password}
    password_confirmation {Settings.role.default_password}
    role {Settings.role.admin}
    birthday {Settings.birthday}
  end
end
