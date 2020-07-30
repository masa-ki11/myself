class RoomsController < ApplicationController
  def show
    @user = User.all
    @relationship = Relationship.all
  end

  def create
    @room = Room.new(room_params)
    @room.users << current_user
    if @room.save
      redirect_to room_path(:id)
    else
      render :new
    end
  end

  def new
    @room = Room.new
    @room.users << current_user
  end
  
  private
  def room_params
    params.permit(:name, user_ids: [])
  end
end
