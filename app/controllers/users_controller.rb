class UsersController < ApplicationController
  def index
    @user = User.all
  end

  def edit
  end

  def create
    @user = User.new(user_params)
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end
  

  def show
    @user = User.find_by(id: params[:id])
    @relationship = Relationship.new

    if user_signed_in?
      @currentUserEntry = UserRoom.where(user_id: current_user.id)
      @userEntry = UserRoom.where(user_id: @user.id)
      
      @currentUserEntry.each do |cu|
        @userEntry.each do |u|
          if cu.room_id == u.room_id
            @haveRoom = true
            @roomId = cu.room_id
          end
        end
      end
          unless @haveRoom
            @room = Room.new
            @entry = UserRoom.new
          end
        
    end
  end

  def followings
    @user = User.find(params[:id])
    @followings = @user.followings.page(params[:page])
  end
  
  def followers
    @user = User.find(params[:id])
    #@followers = @user.followers.page(params[:page])
    @followers = @user.followers.where.not(id: @user.followings.ids).page(params[:page])
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :comment, :image)
  end
end
