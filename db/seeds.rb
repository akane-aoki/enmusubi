# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

3.times do
  User.create(
      name: Faker::Name.name,
      email: Faker::Internet.email,
      password: 'password',
      password_confirmation: 'password'
  )
end

# 5.times do |n|
#   body = Faker::Creature::Dog.breed
#   date = Faker::Date.in_date_period
#   user = User.find(n + 1)
#   Post.create!(body: body, 
#                 date: date,
#                 user: user)
# end