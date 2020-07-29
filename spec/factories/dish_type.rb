FactoryBot.define do
  factory :dish_type do
    name {Faker::Name.name}
    description {Faker::Lorem.sentence}
  end
end
