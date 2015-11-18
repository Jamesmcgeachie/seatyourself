class RestaurantsController < ApplicationController


before_action :get_restaurant, only: [:show, :edit, :update]

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurants_path, notice: "Successfully signed up for a Seat Yourself account."
    else
      render :new
    end
  end

  def show
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
end

