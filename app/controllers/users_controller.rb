class UsersController < ApplicationController
  def index
    @user = current_user
  end

  def show
    @user = User.find_by(id: params[:id])
    if @user
      # User found, proceed with normal flow
    else
      # User not found, redirect to the new user registration form
      redirect_to new_user_registration_path
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # Handle successful creation
      redirect_to @user, notice: "User was successfully created."
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :phone_number, :password, :password_confirmation)
  end
end
