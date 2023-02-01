# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# relationship

puts "start"

2.times do
  Relationship.create
end

# user
2.times do
  User.create(
      name: Faker::Name.name,
      email: Faker::Internet.email,
      password: 'password',
      password_confirmation: 'password',
      relationship_id: 1
  )
end

2.times do
  User.create(
      name: Faker::Name.name,
      email: Faker::Internet.email,
      password: 'password',
      password_confirmation: 'password',
      relationship_id: 2
  )
end

# post
4.times do |n|
  body = Faker::Creature::Dog.breed
  date = Faker::Date.in_date_period
  user = User.find(n + 1)
  Post.create!(body: body,
                date: date,
                user: user)
end

# meet
4.times do |n|
  Meet.create(
      meet_day: Faker::Date.between(from: 30.days.ago, to: Date.today),
      relationship_id: 1
  )
end

Meet.create(
  meet_day: "2023-03-22",
  relationship_id: 1
)

# reward
Reward.create(
  not_meet_day: 30,
  content: "ユニバ！",
  relationship_id: 1
)

# efforts
Effort.create(
  body: "筋トレ",
  user_id: 1
)

puts "end"