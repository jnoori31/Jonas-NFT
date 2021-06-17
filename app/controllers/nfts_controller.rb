class NftsController < ApplicationController

  before_action :authenticate_user!, only: [:toggle_favorite, :new]

  def toggle_favorite
    @nft = Nft.find(params[:id])
    current_user.favorited?(@nft) ? current_user.unfavorite(@nft) : current_user.favorite(@nft)
    # in order to see the like appear we need to refresh
  end

  def toggle_follow
  end

  def liked_nfts
    favorites_array = Favorite.where(favoritable_type: "Nft").select(:favoritable_id).distinct
    nfts_instances = favorites_array.map { |favorite| Nft.find(favorite.favoritable_id) }
    @liked_nfts_hash = {}
    nfts_instances.each do |nft|
      @liked_nfts_hash[nft.id] = nft.favorited.count
    end
    liked_nfts_ordered_array = @liked_nfts_hash.sort_by { |k, v| -v} 
    @liked_nfts_instances = liked_nfts_ordered_array.map { |liked_nft| Nft.find(liked_nft[0])}
    if @liked_nfts_instances.length > 4
      @liked_nfts_instances = @liked_nfts_instances[0..3]
    end
  end

  def show
    @nft = Nft.find(params[:id])
    @user = User.find(@nft.user_id)
    @comment = Comment.new
  end

  def new
  end
  
  def new_nft
    idToken = params[:tokenNft]
    if params[:created] == "true"
      create_bool = true
    else
      create_bool = false
    end
    # checking if the nft is a creation or not
    url = "https://metadata.mintable.app/mintable_gasless/#{idToken}"
    response = RestClient.get(url)
    response_json = JSON.parse(response.body)
    nft = Nft.new(
      name: response_json["name"],
      image_url: response_json["image"],
      description: response_json["subtitle"],
      category: response_json["category"],
      user: current_user,
      media_type: "image",
      price: 100,
      creation: create_bool
    )
    if nft.save
      redirect_to user_path(current_user)
    else
      render :new
    end
  end
end

#destroy(comment)
#favourites gem
#create
#edit(commnet)

# #NFT can be liked by people.
# A NFT can be liked many times and record an ID-
# So How many ID's are there?

# NFT is tracked is every time it is liked and favoritable_id is recorded

# Logically:
# Alex: favoritable_id
# Jonas: favoritable_id
# Felix: favoritable_id
# Total/Count: F-ID = 3
# But:
# is not an intger that you can call count on.

# Every time favoritable_id is seen we will add + 1 to the key/value pair favoritable_id = + 1
# favoritable_id = + 1
# favoritable_id = + 1
# favoritable_id = + 1
# Total = + 1 x 3

