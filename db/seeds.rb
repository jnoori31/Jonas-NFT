require 'faker'
require 'uri'
require 'net/http'
require 'openssl'
require 'json'

puts "Cleaning Databse"
Nft.destroy_all 
Message.destroy_all
Chatroom.destroy_all
User.destroy_all
puts "Creating user"

url = URI("https://api.opensea.io/api/v1/assets?order_direction=desc&offset=0&limit=10")

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true

request = Net::HTTP::Get.new(url)

response = http.request(request)
results = JSON.parse(response.read_body)

emails = ['p@gmail.com', 'j@gmail.com', 'a@gmail.com', 'f@gmail.com']
passwords = ['p12345', 'j12345', 'a12345', 'f12345']
first_names = ['Pierre', 'Jonas', 'Alex', 'Felix']
last_names = ['Ntiruhungwa', 'Høgh-Noori', 'Morey', 'Habert']

puts "Creating 4 users"
emails.each_with_index do |email, index|
  User.create!(
    email: email,
    first_name: first_names[index],
    last_name: last_names[index],
    bio: 'LondonBoi',
    nickname: 'bluerooster',
    password: passwords[index]
  )
end
puts "Creating 4 faker nfts"

results["assets"].each do |result|
  next if result["image_url"].empty?
  Nft.create!(
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
