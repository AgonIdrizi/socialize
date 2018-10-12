class FriendshipsController < ApplicationController
  
  def new
  	
  end
  def create
  	@friendship = Friendship.new(friend_id: current_user.id, user_id: params[:user_id])
  	if @friendship.save
  		redirect_to root_path
  	else
  		render 'new'
  	end
  	#debugger
  	
  end

  def destroy
  	current_user.friends_relationship.find_by(user_id: params[:friendship][:user_id]).destroy
	  respond_to do |format|
	  	format.html {redirect_to root_path}
	  	format.js
	  end
  end
end
