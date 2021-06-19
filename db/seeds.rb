require 'faker'
require 'uri'
require 'net/http'
require 'openssl'
require 'json'
require 'nokogiri'

puts "Cleaning Database"
Notification.destroy_all
Comment.destroy_all
Nft.destroy_all
Message.destroy_all
Chatroom.destroy_all
User.destroy_all
puts "Creating user"


url = URI("https://api.opensea.io/api/v1/assets?order_direction=desc&offset=0&limit=40")
http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true
request = Net::HTTP::Get.new(url)
response = http.request(request)
results = JSON.parse(response.read_body)

emails = ['p@gmail.com', 'j@gmail.com', 'a@gmail.com', 'f@gmail.com']
passwords = ['p12345', 'j12345', 'a12345', 'f12345']
first_names = ['Pierre', 'Jonas', 'Alex', 'Felix']
last_names = ['Ntiruhungwa', 'Høgh-Noori', 'Morey', 'Habert']
base_path = "app/assets/images/"
avatars = [ "https://res.cloudinary.com/dgpj2uzwa/image/upload/v1624097103/default_profile_picture_l2jb9e.jpg", 
            "https://res.cloudinary.com/dgpj2uzwa/image/upload/v1624097003/jonas_pic_o8dy2p.jpg", 
            "https://res.cloudinary.com/dgpj2uzwa/image/upload/v1624097136/alex_pic_ksi57n.png", 
            "https://res.cloudinary.com/dgpj2uzwa/image/upload/v1624097025/photo_felix_ifdkol.png"
          ]

puts "Creating 4 users"
emails.each_with_index do |email, index|
  u = User.create!(
    email: email,
    first_name: first_names[index],
    last_name: last_names[index],
    bio: 'LondonBoi',
    nickname: 'bluerooster',
    password: passwords[index]
  )
  file = URI.open(avatars[index])
  regex = /\/(\w+\.\w+)$/
  fileName = regex.match(avatars[index])[1]
  u.avatar.attach(io: file, filename: fileName)
  # u.avatar.attach(io: File.open(File.join(Rails.root, avatars[index])), filename: 'default_profile_picture.jpg')
end
puts "Creating 4 faker nfts"

users = User.all
users_id = users.map { |user| user.id }
category_nft = %w(Music Art Sport Cinema)


results["assets"].each do |result|
  next if result["image_url"].empty?
  nft = Nft.create!(
    name: result["name"],
    # media_type: Faker::Address.street_address,
    category: category_nft.sample,
    price: rand(60..150),
    description: result["description"],
    image_url: result["image_url"],
    user_id: users_id.sample,
    creation: false,
    external_url: result["permalink"]
    # user: User.find(users_id.sample)
    # except 20 to be randomly allocated in between each user
  )
  # html = URI.open(nft.external_url).read
  # data = Nokogiri::HTML(html)
  # price_nft = data.search('Overflowreact__OverflowContainer-sc-10mm0lu-0.fqMVjm.Price--fiat-amount.Price--fiat-amount-secondary').text.strip[1..-2].to_f
  # if price_nft
  #   nft.price = price_nft
  #   nft.save!
  # end
end

# puts "It works"

#.map
#if image exists push into new array then use array to create
