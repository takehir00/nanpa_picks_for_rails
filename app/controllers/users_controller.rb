class UsersController < ApplicationController
  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(name: params[:user][:name], email: params[:user][:email], password: params[:user][:password], password_confirmation: params[:user][:password_confirmation])
    @user.save
    redirect_to("/")
  end

  def edit
  end

  def login_form
  end

  def login
    #フォームから送られてきたメアドとパスワードでデータベースに対して検索をかけてtrueを返したらsession[:user_id]にここで取得したユーザーのidを入れてredirectする?
    #password_digestを使うようにしたのでなんかそこの照合をする実装が必要なはず。
    @user = User.find(email: params[:post][:email])


  end

  def logout

  end
end
