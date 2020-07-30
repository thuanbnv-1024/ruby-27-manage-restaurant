FactoryBot.define do
  factory :department do
    name {Faker::Name.name}
    description {Faker::Lorem.paragraphs}
  end
end
