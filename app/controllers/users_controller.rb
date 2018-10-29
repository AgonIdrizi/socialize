class UsersController < ApplicationController
  before_action :authenticate_user!
  

  def index
  	@users = User.all.where.not(id: current_user.friends.pluck(:id)).
    includes(image_attachment: [:blob]).paginate(:page => params[:page], :per_page => 32)
  end

  def show
  	@friendship = Friendship.new
  	@user = User.find_by(id: params[:id])
    @posts = @user.posts.includes(comments: [:user])
  
  end

  def destroy
  end

  def edit
  	@user = User.find_by(id: params[:id])
  end

  def update
  	@user = User.find_by(id: params[:id])
  	if params[:image].present? && @user.update_attributes(image: params[:image])
  		redirect_to user_path(@user)
  	else
  		flash.now[:danger] = "Please attach an image to proceed"
  		render 'show'
  	end
  end

  def user_params
  	params.require(:user).permit(:id,:name,:email,:password,:password_confirmation,:image)
  end


end
