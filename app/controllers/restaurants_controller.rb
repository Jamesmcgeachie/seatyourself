class RestaurantsController < ApplicationController


before_action :get_restaurant, only: [:show, :edit, :update]
before_action :owner_authorized, only: [:edit, :update]

  def index
    @restaurants = Restaurant.all
  end

  def new
    unless current_user.owned_restaurant
      @restaurant = Restaurant.new
    else
      flash[:alert] = "You already own a restaurant! Cannot own more than one."
      redirect_to restaurant_path(current_user.owned_restaurant)
    end
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
    if current_user
      @review = @restaurant.reviews.build
    end
  end

  def edit
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

  def owner_authorized
    get_restaurant
    unless @restaurant.is_owned_by?(current_user)
      flash[:alert] = "You do not own this restaurant."
      redirect_to restaurants_path
    end
  end
end

