# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

User.create(email: "merdan.durdiyev@gmail.com", password: "halowelt", password_confirmation: "halowelt")
User.create(email: "mdzine@gmail.com", password: "halamonda", password_confirmation: "halamonda")
User.create(email: "mdyc@yahoo.com", password: "salamdunya", password_confirmation: "salamdunya")

10.times do
  User.create(
    email: Faker::Internet.email,
    password: Faker::Internet.password,
    password_confirmation: Faker::Internet.password
  )
end


User.all.each do |user| 
  10.times do
    user.recipes.create!(
      title: Faker::Food.dish,
      brief_info: Faker::Lorem.sentence,
      description: Faker::Food.description,
      is_halal: Faker::Boolean.boolean,
      is_kosher: Faker::Boolean.boolean,
      is_vegetarian: Faker::Boolean.boolean,
    )
  end
end