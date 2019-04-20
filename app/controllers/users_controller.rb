class UsersController < ApplicationController
  def show
  end

  def new

  end

  def create
    @user = User.new(name: params[:post][:name], email: params[:post][:email], password: params[:post][:password], password_confirmation: params[:post][:password_confirmation])
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
