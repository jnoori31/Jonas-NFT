class NftsController < ApplicationController

  def show
    @nft = Nft.find(params[:id])
end

#destroy(comment)
#favourites gem
#create
#edit(commnet)

