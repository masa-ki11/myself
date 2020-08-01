class ChatsController < ApplicationController
  before_action :set_room, only: [:create, :edit, :update, :destroy]
  before_action :set_chat, only: [:edit, :update, :destroy]

  def index
    @chat = Chat.new
    @chat = @room.chat.includes(:user)
  end
  def create
    if UserRoom.where(user_id: current_user.id, room_id: @room.id)
        @chat = @room.chat.create(chat_params)
        if @chat.save
          @chat = Chat.new
          gets_user_rooms_all_comments
      end
    end
  end

  def edit
  end

  def update
      if @chat.update(chat_params)
          gets_user_rooms_all_comments
      end
  end

  def destroy
    if @comment.destroy
        gets_user_rooms_all_comments
    end
  end

  private


    def set_room
        @room = Room.find(params[:chat][:room_id])
    end

    def set_chat
        @chat = Chat.find(params[:id])
    end

    def gets_user_rooms_all_comments
        @chat = @room.chat.includes(:user).order("created_at asc")
        @user_room = @room.user_room
    end

    def chat_params
        params.require(:chat).permit(:user_id, :comment, :room_id).merge(user_id: current_user.id)
    end
end
