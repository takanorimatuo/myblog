class CommentsController < ApplicationController
  def create
    @comment = Comment.create(text: comment_params[:text], blog_id: comment_params[:blog_id], user_id: current_user.id)
    redirect_to "/blogs/#{@comment.blog_id}"
  end

  private
  def comment_params
    params.require(:comment).permit(:text, :blog_id)
  end
end
