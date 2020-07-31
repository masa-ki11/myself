class ChatsController < ApplicationController
  before_action :set_room, only: [:create, :edit, :update, :destroy]
  before_action :set_message, only: [:edit, :update, :destroy]

  def create
    if UserRoom.where(user_id: current_user.id, room_id: @room.id)
        @comment = Chat.create(chat_params)
            if @comment.save
                @comment = Chat.new
                gets_user_rooms_all_comments
            end
    else
        flash[:alert] = "メッセージの送信に失敗しました"
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

    def set_message
        @comment = Chat.find(params[:id])
    end

    def gets_user_rooms_all_comments
        @comment = @room.comment.includes(:user).order("created_at asc")
        @user_room = @room.user_room
    end

    def chat_params
        params.require(:chat).permit(:user_id, :comment, :room_id).merge(user_id: current_user.id)
    end
end
