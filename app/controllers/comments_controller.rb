class CommentsController < ApplicationController
  def create
    @comment = Comment.new(content: params[:comment][:content], article_id: params[:comment][:article_id], params[:comment][:usr_id])
    @comment.save
  end

  def update
  end

  def destroy
  end
end
