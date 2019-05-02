class Admin::ArticlesController < ApplicationController
  def top
  end

  def index
    @articles = Article.all.page(params[:page]).per(15)
  end

  def new
    @article = Article.new
  end

  def create
    puts "admin側記事登録機能だよ"
    @article = Article.new(url: params[:article][:url], title: params[:article][:title], src: params[:article][:src])
    @article.save
    redirect_to(admin_articles_path)
  end


  def edit
    @article = Article.find(params[:id])
  end

    def update
    @article = Article.find(params[:id])
    @article.update(url: params[:article][:url], title: params[:article][:title], src: params[:article][:src])
    redirect_to(admin_articles_path)
  end

    def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to(admin_articles_path)
  end

end
