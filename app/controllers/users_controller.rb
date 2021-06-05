class UsersController < ApplicationController
    def show
        @user = User.find(params[:id])
        @current_user = User.find_by(id: current_user.id)
        @chatrooms = Chatroom.where(client_id: current_user.id)
    end
end
