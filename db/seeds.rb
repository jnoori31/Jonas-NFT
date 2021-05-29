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

url = URI("https://api.opensea.io/api/v1/assets?order_direction=desc&offset=0&limit=20")

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true

request = Net::HTTP::Get.new(url)

response = http.request(request)
results = JSON.parse(response.read_body)


# puts response.read_body
puts results["assets"][0]["name"]

fakeruser = User.create!(
  email: 'j@gmail.com',
  first_name: 'jonas',
  last_name: 'noori',
  bio: 'LondonBoi',
  nickname: 'bluerooster',
  password: 'random'
  )
puts "Creating 4 faker nfts"
results["assets"].each do |result|
  nft = Nft.create!(
    name: result["name"],
    # media_type: Faker::Address.street_address,
    category: Faker::Fantasy::Tolkien.character,
    price: rand(60..150),
    description: Faker::Marketing.buzzwords,
    user: User.first
  )
end

puts "It works"




