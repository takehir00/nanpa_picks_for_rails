class Admin::UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(name: params[:user][:name], email: params[:user][:email], password: params[:user][:password], password_confirmation: params[:user][:password_confirmation])
    @user.save
    redirect_to(admin_top_path)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update!(name: params[:user][:name], email: params[:user][:email], introduction: params[:user][:introduction], image: params[:user][:image],password: params[:user][:password])
    redirect_to(admin_top_path)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to(admin_top_path)
  end


end
