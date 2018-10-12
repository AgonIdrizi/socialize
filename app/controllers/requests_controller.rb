class RequestsController < ApplicationController

	def new
	end

	def create
		current_user.friend_requests_sent_relationship.create(accepter_id: params[:user_id] )
		respond_to do |format|
		format.js
	  	format.html {redirect_to root_path}
	  	
	  	end
	end

	def destroy
	  request = Request.where(["sender_id = ? and accepter_id = ?", params[:sender_id], current_user.id])
	  if request.destroy_all
	  	redirect_to root_path
	  else
	  end
	end
end
