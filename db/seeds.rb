# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts "Cleaning Databse"
Nft.destroy_all
User.destroy_all
puts "Creating user"

fakeruser = User.create!(
  email: 'j@gmail.com',
  first_name: 'jonas',
  last_name: 'noori',
  bio: 'LondonBoi',
  nickname: 'bluerooster',
  password: 'random'
  )
puts "Creating 4 faker nfts"
4.times do
  nft = Nft.create!(
    name: Faker::Name.name,
    # media_type: Faker::Address.street_address,
    category: Faker::Fantasy::Tolkien.character,
    price: rand(60..150),
    description: Faker::Marketing.buzzwords,
    user: User.first
  )
end

puts "It works"

