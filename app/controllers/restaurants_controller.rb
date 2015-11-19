class RestaurantsController < ApplicationController


before_action :get_restaurant, only: [:show, :edit, :update]
before_action :authorize_owner, only: [:edit, :update, :destroy]

  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
  	@user = current_user
    @restaurant = @user.create_owned_restaurant(restaurant_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant), notice: "Successfully signed up for a Seat Yourself account."
    else
      render :new
    end
  end

  def show
  end

  def edit
  	 @restaurant = Restaurant.find(params[:id])
  end

  def update
    if @restaurant.update_attributes(restaurant_params)
      redirect_to root_path, notice: "Successfully updated your restaurant account"
    else
      render :edit
    end
  end

  private
  def restaurant_params
    params.require(:restaurant).permit(:name, :summary, :street_number, :street_name, :city, :province, :postal_code, :country, :phone_number, :website_url)
  end

  def get_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def authorize_owner
    @restaurant = Restaurant.find(params[:id])
    unless current_user == @restaurant.user_id
      flash[:alert] = "You do not own this restaurant."
      redirect_to restaurants_path
    end
  end

end

