class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
  end

  def show
  	@friendship = Friendship.new
  	@user = User.find_by(id: params[:id])
  end

  def destroy
  end
end
