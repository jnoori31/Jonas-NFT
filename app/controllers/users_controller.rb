class UsersController < ApplicationController
    def show
        @user = User.find(params[:id])
        @chatrooms = Chatroom.where(client_id: current_user.id)
        @Nft = Nft.where(user: @user)
        # ==> Nft.where(user_id: @user.id)
        # ==> @Nft = @user.nfts

        # allows to show by default the owned nfts but not the liked or the created without clicking on the button
        # on the user page profile
        # if params[:category] == "liked"
            # nft_favorite = @user.all_favorites
            # nft_favorite returns a table of favorite item not the instances of nft directly
            # nft_ids = nft_favorite.map { |nft| nft.favoritable_id }
            # find all ids of the nft liked by the user
            # @Nft = nft_ids.map { |nft_id| Nft.find(nft_id) }
            #reconstruct an array of liked Nfts
        # elsif params[:category] == "created"
        #     @Nft = nft.where(creation: true)
        # else
        #     @Nft = nft.where(creation: false)
        # end
    end

    def toggle_follow
    end
end
