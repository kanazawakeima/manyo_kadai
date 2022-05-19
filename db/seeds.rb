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
