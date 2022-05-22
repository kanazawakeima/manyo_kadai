# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(
   name: 'keima',
   email: 'keima@keima.com',
   password: 'keima@keima.com',
   password_confirmation: 'keima@keima.com',
   admin: true
)

User.create!(
  name: 'test',
  email: 'test@test.com',
  password: 'test@test.com',
  password_confirmation: 'test@test.com',
  admin: false
)

10.times do |n|
  name = Faker::Name.name
  email = Faker::Internet.email
  password = "password"
  admin = false
  User.create!(name: name,
               email: email,
               password: password,
               admin: admin
                )
end

10.times do |n|
  title = Faker::JapaneseMedia::Naruto.character
  content = Faker::JapaneseMedia::Naruto.village
  Task.create!(title: title,
               content: content,
               deadline: "2022/07/30",
               status: "未着手",
               priority: "中",
               user_id: n + 1
               )
end

10.times do |n|
  Label.create(name: "test#{n + 1}")
end

%W[仕事 家庭 プライベート].each { |a| Label.create(name: a) }
