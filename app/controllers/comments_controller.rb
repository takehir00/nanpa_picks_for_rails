class CommentsController < ApplicationController
  before_action :login?

  def create
    @comment = Comment.new(content: params[:comment][:content], article_id: params[:article_id], user_id: params[:user_id])
    @comment.save
    redirect_to("/articles/#{params[:article_id]}")
  end

  def update
  end

  def destroy
  end

  private

  def login?
    if current_user.empty?
      flash[:notice] = "ログインしてください"
      redirect_to(login_form_path)
    end
  end
end
