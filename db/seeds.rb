# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require 'uri'
require 'net/http'
require 'openssl'
require 'json'

puts "Cleaning Databse"
Nft.destroy_all
User.destroy_all
puts "Creating user"

url = URI("https://api.opensea.io/api/v1/collections?offset=0&limit=30")

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true

request = Net::HTTP::Get.new(url)

response = http.request(request)
results = JSON.parse(response.read_body)

puts results["collections"][0]["name"]

emails = ['p@gmail.com', 'j@gmail.com', 'a@gmail.com', 'f@gmail.com']
passwords = ['p12345', 'j12345', 'a12345', 'f12345']
first_names = ['Pierre', 'Jonas', 'Alex', 'Felix']
last_names = ['Ntiruhungwa', 'Høgh-Noori', 'Morey', 'Habert']

puts "Creating 4 users"
emails.each_with_index do |email, index|
  fakeruser = User.create!(
    email: email,
    first_name: first_names[index],
    last_name: last_names[index],
    bio: 'LondonBoi',
    nickname: 'bluerooster',
    password: passwords[index]
  )
end
puts "Creating 4 faker nfts"

results["collections"].each do |result|
  nft = Nft.create!(
    name: result["name"],
    # media_type: Faker::Address.street_address,
    category: Faker::Fantasy::Tolkien.character,
    price: rand(60..150),
    description: result["description"],
    image_url: result["image_url"],
    user: User.first
  )
end

puts "It works"

#.map
#if image exists push into new array then use array to create
