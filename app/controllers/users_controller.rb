class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = @current_user
  end

  def new
    @user = User.new
  end

  def edit
    @user = @current_user
  end

  def update
  end

  def create
  end

  def destroy
  end
end
