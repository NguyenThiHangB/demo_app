class UsersController < ApplicationController
  before_action :find_by, only: %i(edit update destroy)

  def index; end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = "Register success."
      redirect_to users_path
    else
      flash[:error] = "Register failed."
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end

  def find_user
    @user = User.find_by id: params[:id]
    return if @user
  end
end
