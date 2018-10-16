class CommentsController < ApplicationController
	before_action :authenticate_user!
  before_action :find_commentable
  def new
  	@comment = Comment.new
  end

  def create
    
  	@comment = @commentable.comments.new(body: params[:comment][:body], user_id: current_user.id)
    byebug
    if @comment.save
      redirect_to posts_path
    else
      render 'new'
    end
  end

  private

  def comment_params
  	params.require(:comment).permit(:body,:post_id,:comment_id)
  end

  def find_commentable
  	@commentable = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
  	@commentable = Post.find_by_id(params[:comment][:post_id]) if params[:comment][:post_id]
  end
end
