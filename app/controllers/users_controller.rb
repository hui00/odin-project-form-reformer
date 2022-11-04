class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create

    @user = User.new(username: params[:user][:username], email: params[:user][:email], password: params[:user][:password])
    # @user = User.new(user_params)

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

  # private def user_params
  #   params.require(:user).permit(:username, :email, :password)
  #
  # end
end
