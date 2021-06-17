class UsersController < ApplicationController
    def show
        @user = User.find(params[:id])
        @chatrooms = Chatroom.where(client_id: current_user.id).or(Chatroom.where(owner_id: current_user.id))
        nft = Nft.where(user: @user)
        @owned_count = Nft.where(user: @user).count
        @created_count = Nft.where(user: @user).where(creation: true).count
        @liked_count = @user.favorites.where(favoritable_type: "Nft").count

        following_fav = @user.all_favorites.where(favoritable_type: "User")
        following_ids = following_fav.map { |following| following.favoritable_id }
        @following_users = following_ids.map {|following_id| User.find(following_id)}

        follower_fav = Favorite.where(favoritable_type: "User").where(favoritable_id: @user.id)
        # favoritable_id = id of the one being followed
        follower_ids = follower_fav.map { |follower| follower.favoritor_id }
        @follower_users = follower_ids.map {|follower_id| User.find(follower_id)}
        # ==> Nft.where(user_id: @user.id)
        # ==> @Nft = @user.nfts

        # allows to show by default the owned nfts but not the liked or the created without clicking on the button
        # on the user page profile
        if params[:category] == "liked"
            nft_favorite = @user.all_favorites.where(favoritable_type: "Nft")
            # nft_favorite returns a table of favorite item not the instances of nft directly
            nft_ids = nft_favorite.map { |nft| nft.favoritable_id }
            # find all ids of the nft liked by the user
            @Nft = nft_ids.map { |nft_id| Nft.find(nft_id) }
            #reconstruct an array of liked Nfts
        elsif params[:category] == "created"
            @Nft = nft.where(creation: true)
        else
            @Nft = nft.where(creation: false)
            # by default we show the owned ones
        end
    end
end
