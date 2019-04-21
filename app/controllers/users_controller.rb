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
