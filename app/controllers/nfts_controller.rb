
class NftsController < ApplicationController
  def show
    @nft = Nft.find(params[:id])
    @user = User.find(@nft.user_id)
    @comment = Comment.new
  end

  def new
  end
  
  # def new_nft
  #   idToken = params[:tokenNft]
  #   url = "https://metadata.mintable.app/mintable_gasless/#{idToken}"
  #   response = RestClient.get(url)
  # end

end

#destroy(comment)
#favourites gem
#create
#edit(commnet)

