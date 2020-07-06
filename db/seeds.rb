4.times do
  name = Faker::Name.name
  description = Faker::Lorem.sentence(5)
  Department.create! name: name, description: description
end

departments = Department.order(:created_at).take(4)
15.times do
  name = Faker::Name.name
  departments.each { |department| department.users.create! name: name }
3.times do |n|
  name = Faker::Name.name
  Department.create!(name: name,
              description: "user description")
end
99.times do |n|
  name = Faker::Name.name
  email = "user-#{n+1}@gmail.com"
  User.create!(name: name,
              email: email,
              password: "123456",
              password_confirmation: "123456",
              address: "HN",
              department_id: 1,
              role: "user",
              birthday: "2000",
              phone: "8888",
              gender: "man",
              activated: true)
end
