class UsersController < ApplicationController
  def index
    @user = User.all
  end

  def edit
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
  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :comment, :image)
  end
end
