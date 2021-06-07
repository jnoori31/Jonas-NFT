
class NftsController < ApplicationController
  def show
    @nft = Nft.find(params[:id])
    @comment = Comment.new
  end

  def new
  end
  
  def new_nft
    idToken = params[:tokenNft]
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
      price: 100
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

