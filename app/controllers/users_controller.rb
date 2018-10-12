class UsersController < ApplicationController
  
  def index
  end

  def show
  	@friendship = Friendship.new
  	@user = User.find_by(id: params[:id])
  end

  def destroy
  end
end
