class NftsController < ApplicationController

  before_action :authenticate_user!, only: [:toggle_favorite, :new]

  def toggle_favorite
    @nft = Nft.find(params[:id])
    if current_user.favorited?(@nft)
      current_user.unfavorite(@nft) 
    else
      current_user.favorite(@nft)
    end
    # redirect_to nft_path(@nft, anchor: "heart-btn")
    # in order to see the like appear we need to refresh
  end

  def toggle_follow
  end

  def liked_nfts
    # Purpose to find all NFTS liked by current_user AND others!!!!!
    # Favorite.all in console to see variables/sql
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
    if current_user == @user
      @nft.mark_notifications_as_seen
    end
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
    if response_json["error"]
      flash.now[:alert] = 'Error not a valid Token Id'
      render :new
    else
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

end

# previous liked method
# # @liked_nfts = {}
#     # # key= favoritable_id: value = amount
#     # favorites = Favorite.where(favoritable_type: "Nft")
#     # # Looking for NFT tha thave been favorited by user ONLY
#     # favorites.each do |favorite|
#     #   key = favorite.favoritable_id
#     #   # favoritable_id is the ID of the specific category type in this case a NFT = NFT.id
#     #   # It is not the ID of the Favorite instance that you create when you like an NFT (rails c Favortie.all)
#     #   if @liked_nfts.key?(key)
#     #     amount = @liked_nfts[key]
#     #     @liked_nfts[key] = amount + 1
#     #     # Example - A,J,A: like the same NFT. 3 new insntaces of Favorites are created with 3 different favoritor_id but 3 of the same favoritable_id(nft we liked)
#     #     #@liked to be accessed in the HTML
#     #   else
#     #     @liked_nfts[key] = 1
#     #   end
#     # end
#     # liked_nfts_ordered = @liked_nfts.sort_by { |k, v| -v}
#     # # An Array of Arrays [[key,value], [key,value]] Favoritable_id and amount

#     # @liked_nfts1 = liked_nfts_ordered.map { |liked_nft| Nft.find(liked_nft[0])}
#     # #[NFT1, NFT2, NFT3] that have been liked and ordered by accending.
#     # # So we have an array where we store the instances of NFT
#     # # In the HTML we will iterate over the array liked_nfts1 and the hash @liked_nfts allows us to acess the number of likes.
#     # #@liked_nfts1.each
#     # # @liked_nfts[nft.id] = likes.


