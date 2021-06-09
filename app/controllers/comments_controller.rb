class CommentsController < ApplicationController
  def create
    @nft = Nft.find(params[:nft_id])
    @comment = Comment.new(comment_params)
    @comment.nft = @nft
    @comment.user = current_user
    if @comment.save
      redirect_to nft_path(@nft, anchor: "comment-#{@comment.id}")
    end
  end

def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    @nft = Nft.find(params[:nft_id])
    redirect_to nft_path(@nft)
end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end


# @nft = Nft.find(params[:nft_id])
# @comment = @nft.comments
