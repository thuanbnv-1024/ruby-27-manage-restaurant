# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
4.times do
  name = Faker::Name.name
  description = Faker::Lorem.sentence(5)
  Department.create! name: name, description: description
end

departments = Department.order(:created_at).take(4)
15.times do
  name = Faker::Name.name
  departments.each { |department| department.users.create! name: name }
end
