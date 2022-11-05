class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create

    # @user = User.new(username: params[:user][:username], email: params[:user][:email], password: params[:user][:password])
    @user = User.new(user_params)

    if @user.save
      puts("User saved")
      flash[:success] = "new user created"
      redirect_to action: "new"
    else
      # show errors
      puts("User not saved: " + @user.errors.full_messages.to_s)
      flash[:danger] = "User not saved: " + @user.errors.full_messages.to_s
      render :new, status: :unprocessable_entity

    end

  end

  def update
    //
    @user = User.find(params[:id])
    if @user.update_columns(username: params[:user][:username])
      # if @user.update(params.require(:user).permit(:username))
      puts("User updated")
      flash[:success] = 'User updated'
      redirect_to action: 'index'
    else
      puts("User not updated: " + @user.errors.full_messages.to_s)
      flash[:danger] = 'User not updated: ' + @user.errors.full_messages.to_s
      render :edit, status: :unprocessable_entity
    end
  end

  private def user_params
    user_params = params.require(:user).permit(:username, :email, :password)
    user_params.delete(:password) unless user_params[:password].present?
    user_params.delete(:email) unless user_params[:email].present?
    user_params

  end
end
