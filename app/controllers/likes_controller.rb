class LikesController < ApplicationController
  def index
  	@post = Post.find_by(id: params[:post_id])
  	@likes = @post.likes
  end

  def create
  	@post = Post.find_by(id: params[:post_id])
  	if @post.likes.create(name: "#{current_user.name}", user_id: current_user.id)
  	  redirect_to posts_path
  	else
  	end
  end
end
