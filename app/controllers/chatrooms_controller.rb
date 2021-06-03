class ChatroomsController < ApplicationController
    def create
        owner = User.find(params[:user_id])
        if Chatroom.exists?(name: "chatroom-#{current_user.first_name}-#{owner.first_name}")
            chatroom = Chatroom.find_by(name:"chatroom-#{current_user.first_name}-#{owner.first_name}")
            redirect_to chatroom_path(chatroom)
            return
        elsif Chatroom.exists?(name: "chatroom-#{owner.first_name}-#{current_user.first_name}")
            chatroom = Chatroom.find_by(name:"chatroom-#{owner.first_name}-#{current_user.first_name}")
            redirect_to chatroom_path(chatroom)
            return
        else
            @chatroom = Chatroom.new()
            @chatroom.name = "chatroom-#{current_user.first_name}-#{owner.first_name}"
            @chatroom.owner_id = owner.id
            @chatroom.client_id = current_user.id
        end
        if @chatroom.save
            redirect_to chatroom_path(@chatroom)
            return
        else
            redirect_to root_path
        end
    end

    def show
        @chatroom = Chatroom.find(params[:id])
        @owner = User.find(@chatroom.owner_id)
        @client = User.find(@chatroom.client_id)
        @message = Message.new()
    end
end
