class UsersController < ApplicationController

  before_action :get_user, only: [:show, :edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to new_restaurant_path, notice: "Successfully signed up for a Seat Yourself account."
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      redirect_to root_path, notice: "Successfully updated your user account"
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

  def get_user
    @user = User.find(params[:id])
  end

  def user_profile_permission
    get_user
    unless @user.id == current_user
      flash[:alert] = "That's not your profile ID. Redirected to your profile."
      redirect_to user_path(@user)
    end
  end

end
