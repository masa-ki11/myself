class RoomsController < ApplicationController
  def show
    @user = User.all
    @relationship = Relationship.all
  end

  
end
