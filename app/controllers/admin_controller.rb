class AdminController < ApplicationController
  def top
  end

  def articles_index
    @articles = Article.all
  end

  def articles_new
  end

  def articles_edit
    @article = Article.find(params[:id])
  end

  def create
  end
end
