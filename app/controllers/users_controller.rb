class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    #このユーザーのidを持つコメントたちを検索する。
    comments = Comment.where(user_id: @user.id)
    #そのコメントたちの持つarticle_idから記事たちを検索してviewに返す
    #一つの記事に対しての一人のユーザーのコメントは複数ある。このまま抽出すると記事がダブる。配列のダブり要素を排除するメソッドがあればそれ使う。なかったらちょっと考える
    articles = Array.new
    #そのコメントたちの持つarticle_idから記事たちを検索して、配列にぶち込んでいく
    comments.each do |comment|
      article = Article.find_by(id: comment.article_id)
      articles.push(article)
    end
    @articles = articles.uniq
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(name: params[:user][:name], email: params[:user][:email], password: params[:user][:password], password_confirmation: params[:user][:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "サインアップに成功しました"
      redirect_to("/")
    else
      redirect_to("/")
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update!(name: params[:user][:name], email: params[:user][:email], introduction: params[:user][:introduction], image: params[:user][:image],password: params[:user][:password])
    redirect_to("/")
  end

  def login_form
  end

  def login
    @user = User.find_by(email: params[:session][:email])
    if @user&.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      flash[:notice] = "ログインしました"
      redirect_to("/")
    else
      @user.email = params[:session][:email]
      redirect_to("/login_form")
    end
  end

  def logout
    puts session[:user_id]
    reset_session
    flash[:notice] = "ログアウトしました"
    redirect_to("/")
  end
end
