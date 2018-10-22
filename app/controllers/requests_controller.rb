class RequestsController < ApplicationController
	before_action :authenticate_user!
	def new
	end

	def create
		@user = User.find_by(id: params[:request][:accepter_id])
		current_user.friend_requests_sent_relationship.create(accepter_id: params[:request][:accepter_id] )
		respond_to do |format|
		format.js
	  	format.html {redirect_to root_path}
	  	
	  	end
	end

	def destroy
		@user = User.find_by(id: params[:request][:id])
	  request = Request.find_by(id: params[:id])
	  if request.destroy
	  	respond_to do |format|
	  	format.html {redirect_to root_path}
		format.js
		end
	  else
	  
	  
	  end
	end
end
