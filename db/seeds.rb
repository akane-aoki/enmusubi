# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# relationship

puts "start"

# 2.times do
#   relationship = Relationship.create!
#   puts "#{relationship.id}を作成しました"
# end

# # user
# 2.times do
#   user = User.create!(
#       name: Faker::Name.name,
#       email: Faker::Internet.email,
#       password: 'password',
#       password_confirmation: 'password',
#       relationship_id: 1
#   )
#   puts "#{user.name}を作成しました"
# end

# # post
# 2.times do |n|
#   body = Faker::Creature::Dog.breed
#   date = Faker::Date.in_date_period
#   user = User.find(n + 1)
#   post = Post.create!(body: body,
#                       date: date,
#                       user: user)
#   puts "#{post.body}を作成しました"
# end

# # meet
# 4.times do |n|
#   meet = Meet.create!(
#       meet_day: Faker::Date.between(from: 30.days.ago, to: Date.today),
#       relationship_id: 1
#   )
#   puts "#{meet.meet_day}を作成しました"
# end

# Meet.create!(
#   meet_day: "2023-03-22",
#   relationship_id: 1
# )

# # reward
# Reward.create!(
#   not_meet_day: 30,
#   content: "ディズニー！",
#   relationship_id: 1
# )

# # efforts
# Effort.create!(
#   body: "筋トレ",
#   user_id: 1
# )

# 花子
user = User.create!(
  name: "花子",
  email: "example@example.com",
  password: 'password',
  password_confirmation: 'password',
  relationship_id: 1
)
puts "#{user.name}を作成しました"

post = Post.create!(
  body: "花子ががんばったことだよ〜",
  date: "2023-01-20",
  user_id: 1
)

4.times do |n|
  meet = Meet.create!(
    meet_day: Faker::Date.between(from: 30.days.ago, to: Date.today),
    relationship_id: 1
  )
end

Reward.create!(
  not_meet_day: 50,
  content: "ハワイ！",
  relationship_id: 1
)

Effort.create!(
  body: "資格の勉強",
  user_id: 1
)

puts "userは#{User.count}件"
puts "postは#{Post.count}件"
puts "effortは#{Effort.count}件"
puts "end"