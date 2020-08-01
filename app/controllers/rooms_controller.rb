class RoomsController < ApplicationController
  
  def index

    @user = User.all
    @relationship = Relationship.all
    
  end
  
  def show
    @user = User.all
    @rooms = current_user.rooms.includes(:chats).order("comment.created_at desc")
    
    @room = Room.find(params[:id])
    if UserRoom.where(user_id: current_user.id, room_id: @room.id).present?
      @chats = @room.chats.includes(:user).order("created_at asc")
      @chat = Chat.new
      @user_room = @room.user_rooms
    else
      redirect_back(fallback_location: root_path)
    end
    
  end

  def create
    @room = Room.create
    @joinCurrentUser = UserRoom.create(user_id: current_user.id, room_id: @room.id)
    @joinUser = UserRoom.create(join_room_params)
    redirect_to room_path(@room.id)
  end

  def new
    @room = Room.new
    @room.users << current_user
  end
  
  private
  def room_params
    params.permit(:name, user_ids: [])
  end

  def join_room_params
    params.permit(:user_id, :room_id).merge(room_id: @room.id)
end
end
