FactoryBot.define do
  factory :dish do
    name {Faker::Name.name}
    price {"150000"}
    description {Faker::Lorem.sentence}
    status {Settings.dishes.status}

    association :dish_type
  end
end
