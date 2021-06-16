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
    # @nfts = Nft.where(current_user.favorited?(@nft) == true)
    @liked_nfts = {}
    favorites = Favorite.where(favoritable_type: "Nft")
    favorites.each do |favorite|
      key = favorite.favoritable_id
      if @liked_nfts.key?(key)
        amount = @liked_nfts[key]
        @liked_nfts[key] = amount + 1
      else
        @liked_nfts[key] = 1
      end
    end
    liked_nfts_ordered = @liked_nfts.sort_by { |k, v| -v} 
    liked_nfts_total = liked_nfts_ordered.map { |liked_nft| Nft.find(liked_nft[0])}
    if liked_nfts_total.length > 5
      @liked_nfts1 = liked_nfts_total[0..5]
    else
      @liked_nfts1 = liked_nfts_total
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

