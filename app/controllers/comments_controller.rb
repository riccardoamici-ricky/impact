class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @post = Post.find(params[:post_id])
    @comment.post = @post
  end

  def create
    @comment = Comment.new(comment_params)
    @post = Post.find(params[:post_id])
    @comment.post = @post
    @comment.user = current_user
    if @comment.save
      redirect_to posts_path, notice: 'comment was successfully created.'
    else
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
