class ArticlesController < ApplicationController
  def top
    # agent = Mechanize.new
    # page = agent.get("http://pkup.tokyo/archives/9492")
    # @title = page.title
    # @src = page.search("img")[0]["src"]
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
    @comment = Comment.new
  end

  def create
    @article = Article.new(url: params[:url], title: params[:title], src: params[:src])
    @article.save
    redirect_to("/admin/articles/index")
  end

  def update
    @article = Article.find(params[:id])
    @article.url = params[:put][:url]
    @article.title = params[:put][:title]
    @article.src = params[:put][:src]
    @article.save
    redirect_to("/admin/articles/index")
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to("/admin/articles/index")
  end


end
