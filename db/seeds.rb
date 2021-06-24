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


emails = ['p@gmail.com', 'j@gmail.com', 'a@gmail.com', 'f@gmail.com']
passwords = ['p12345', 'j12345', 'a12345', 'f12345']
first_names = ['Pierre', 'Jonas', 'Alex', 'Felix']
last_names = ['Ntiruhungwa', 'Høgh-Noori', 'Morey', 'Habert']
base_path = "app/assets/images/"
avatars = [ 
            "https://res.cloudinary.com/dgpj2uzwa/image/upload/v1624097103/default_profile_picture_l2jb9e.jpg", 
            "https://res.cloudinary.com/dgpj2uzwa/image/upload/v1624097003/jonas_pic_o8dy2p.jpg", 
            "https://res.cloudinary.com/dgpj2uzwa/image/upload/v1624097136/alex_pic_ksi57n.png", 
            "https://res.cloudinary.com/dgpj2uzwa/image/upload/v1624097025/photo_felix_ifdkol.png"
          ]
        
token_ids = {
  sport: [
      "98469536045481062864357924803882353092823731748641849454018582045655350378497",
      "75004846811008223038270362467031097862578394162493344216807908680784205053953",
      "53354433720548305001605000431668021393114197686356563436805652957630561361841",
      "93924701258133737236105116072908809426214588571841940130583917135551029837825",
      "7366277581595694758503381443534368510085174382434493839387846607896525668353"
  ],
  art: [
      "15112367901627216218205065827521268270470157825664407247069103470070527426561",
      "60471567281376696376611034245875074544551562148615752380742119952763305590785",
      "60471567281376696376611034245875074544551562148615752380742119951663793963009",
      "67596398333738267971727378646761013756170830733454327583377386146830789640193",
      "60471567281376696376611034245875074544551562148615752380742119948365259079681"
  ],
  music: [
      "29357274863954818552610094837351531520396379897167104189577589337551122989057",
      "20963594112118743937521916859001169698929410270096408362391334603496408219649",
      "79305120463500971131002132865045426626661515072001708844338310151016722464769",
      "20963594112118743937521916859001169698929410270096408362391334602396896591873",
      "79305120463500971131002132865045426626661515072001708844338310134524048048129"
  ],
  collectibles: [
      "52737835343860599013055050671894361787765153638326334914649709299807851380737",
      "13763240861708469615849241520484165698663789809915454895101871928898461106177",
      "2828487457027846642038799962727664059097231626088266993890374432809218473985",
      "26069505368974828872905627611543659651502035895096402323141481531337905012737",
      "112350283466636638112186473525676876061731733465217036530849274904498866749441"
  ]
}

puts "Creating 4 users"
emails.each_with_index do |email, index|
  u = User.create!(
    email: email,
    first_name: first_names[index],
    last_name: last_names[index],
    bio: 'LondonBoi',
    nickname: 'bluerooster',
    password: passwords[index],
    admin: true
  )
  file = URI.open(avatars[index])
  regex = /\/(\w+\.\w+)$/
  fileName = regex.match(avatars[index])[1]
  u.avatar.attach(io: file, filename: fileName)
  # cloudinary to open in view I) needs to be the file which is the url link for avatar
  # and filenmane is the appended code that specifies our avatar. Use regex to get that piece of code.
end
puts "Creating 4 faker nfts"

users = User.all
users_id = users.map { |user| user.id }
# creating an array of user ids
# category_nft = %w(music art sport collectibles) flexKnob

token_ids.each_with_index do |(key, value), index|
  value.each do |token_id|
      url = URI("https://api.opensea.io/api/v1/assets?token_ids=#{token_id}")
      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = true
      request = Net::HTTP::Get.new(url)
      response = http.request(request)
      json_res = JSON.parse(response.read_body)
      result = json_res["assets"][0]
      # open the url and 0 is the first array in the hash that containts the nft information.
      
      url_price = URI("https://opensea.io/assets/#{result["asset_contract"]["address"]}/#{token_id}")
      # Parse the nft asset/result enter 0 in the array and find asset_contract and addresss (you need that in the url to find the nft)
      doc = Nokogiri::HTML(open(url_price).read)

      # nokogiri to open the URI and then read, regex will find the price for us.
      regex = /\d+\.?(\d+)?/  

      price_text = doc.search('.Overflowreact__OverflowContainer-sc-10mm0lu-0.fqMVjm.Price--fiat-amount.Price--fiat-amount-secondary').text
      # .text == in javascript innerText
      # price_text = "($190,15)"   == 190,15
      # if there's no price, price_text = ""
      if price_text != ""
          price = regex.match(price_text)[0].to_f
      else
          price = rand(0..10)
      end

      nft = Nft.create!(
          name: result["name"],
          media_type: "image",
          user_id: users_id.sample,
          category: key.to_s,
          price: price,
          description: result["description"],
          image_url: result["image_url"],
          creation: false,
          external_url: result["permalink"]
      )
      puts nft.name
  end
end
