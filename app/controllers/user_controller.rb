class UserController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, notice: "Successfully signed up for a Seat Yourself account."
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :password, :password_confirmation)
  end
end
