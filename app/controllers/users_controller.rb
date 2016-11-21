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
    @user = set_user
    if @user.update(user_params)
      redirect_to @user
    else
      render :edit
    end
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    user = set_user
    user.destroy
    redirect_to root_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :name, :email, :password, :password_confirmation)
  end
end
