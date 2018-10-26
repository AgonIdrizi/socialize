class PostsController < ApplicationController
  before_action :authenticate_user! 
  def index
    
    @feed = show_all_posts_of_friends
  end

  def show
  	@post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new
    if current_user.posts.create(post_params)
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def post_params
    params.require(:post).permit(:body)
  end
end
