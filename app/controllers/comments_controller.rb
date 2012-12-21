class CommentsController < ApplicationController
  respond_to :html, :json
  expose(:comments) { current_user.comments }
  
  def create
    comment = comments.create params[:comment]
    redirect_to comment.commentable
  end

end
