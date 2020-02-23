# frozen_string_literal: true

class Admin::UsersController < Admin::BaseController
  before_action :find_or_initialize_user, except: [:index]

  def show; end

  def index
    @users = User.page(params[:page]).reorder(sort_order)
    respond_to do |format|
      format.html
      format.js { render file: "/shared/admin.js.erb" }
    end
  end

  def new; end

  def create
    if @user.save
      redirect_to(admin_users_path)
    else
      render(:new)
    end
  end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to(admin_users_path)
    else
      render(:edit)
    end
  end

  def destroy
    @user.destroy
    redirect_to(admin_users_path)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def find_or_initialize_user
    @user = params[:id] ? User.find(params[:id]) : User.new
  rescue ActiveRecord::RecordNotFound
    redirect_to(
      admin_users_path,
      alert: "User with ID #{params[:id]} not found!"
    )
  end

  def user_params
    params.fetch(:user, {}).permit(:username, :email, :admin)
  end

  def sort_options
    { 'username' => 'username' }
  end
end
