class LikesController < ApplicationController
  def index
  	@post = Post.find_by(id: params[:post_id])
  	@likes = @post.likes
  end

  def create
  	@post = Post.find_by(id: params[:post_id])
    @like = @post.likes.create(user_id: current_user.id)
    #debugger
  	if @like.save
  	  respond_to do |format|
      format.html {redirect_to root_path}
      format.js 
      end
  	else
      redirect_to root_path
  	end
  end

  def destroy
    @post = Post.find_by(id: params[:post_id])
    @like = @post.likes.find_by(user_id: current_user.id)
    if @like.destroy
      respond_to do |format|
        format.html {redirect_to root_path}
        format.js 
      end
    else
      redirect_to root_path
    end
  end
end
