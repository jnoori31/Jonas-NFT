class NftsController < ApplicationController
  def show
    @nft = Nft.find(params[:id])
    @comment = Comment.new
  end
end
