class RoomsController < ApplicationController
  def show
    @user = User.all
  end
end
