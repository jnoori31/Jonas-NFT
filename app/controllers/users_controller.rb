class UsersController < ApplicationController
    def show
        @user = User.find(params[:id])
        @chatrooms = Chatroom.where(client_id: current_user.id)
    end
end
