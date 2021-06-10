class UsersController < ApplicationController
    def show
        @user = User.find(params[:id])
        @chatrooms = Chatroom.where(client_id: current_user.id)
        @Nft = Nft.where(user: @user)
        # ==> Nft.where(user_id: @user.id)
        # ==> @Nft = @user.nfts
    end

    def toggle_follow
    end
end
