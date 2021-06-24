# url = URI("https://api.opensea.io/api/v1/assets?order_direction=desc&offset=0&limit=40")
# http = Net::HTTP.new(url.host, url.port)
# http.use_ssl = true
# request = Net::HTTP::Get.new(url)
# response = http.request(request)
# results = JSON.parse(response.read_body)

# results["assets"].each do |result|
#   next if result["image_url"].empty?
  # nft = Nft.create!(
  #   name: result["name"],
  #   media_type: Faker::Address.street_address,
  #   category: category_nft.sample,
  #   price: rand(60..150),
  #   description: result["description"],
  #   image_url: result["image_url"],
  #   user_id: users_id.sample,
  #   creation: false,
  #   external_url: result["permalink"]
  # user: User.find(users_id.sample)
  #   except 20 to be randomly allocated in between each user
  # )
  # html = URI.open(nft.external_url).read
  # data = Nokogiri::HTML(html)
  # price_nft = data.search('Overflowreact__OverflowContainer-sc-10mm0lu-0.fqMVjm.Price--fiat-amount.Price--fiat-amount-secondary').text.strip[1..-2].to_f
  # if price_nft
  #   nft.price = price_nft
  #   nft.save!
  # end
# end

# puts "It works"

#.map
#if image exists push into new array then use array to create
# u.avatar.attach(io: File.open(File.join(Rails.root, avatars[index])), filename: 'default_profile_picture.jpg')
