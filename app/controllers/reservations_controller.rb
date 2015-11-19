class ReservationsController < ApplicationController

  before_action :get_restaurant
  before_action :get_reservation

  def index
  end

  def show
  end

  def new
    @reservation = @restaurant.reservations.build
  end

  def create
    @reservation = @restaurant.reservations.build(reservation_params)
    @reservation.user = current_user
    if @reservation.save
      redirect_to restaurant_path(@restaurant), notice: "Your reservation was successfully created!"
    else
      render restaurant_path(@restaurant)
    end
  end
  end

  def edit
  end

  def update
    if @reservation.update_attributes(reservation_params)
      redirect_to restaurant_path(@restaurant), notice: "Successfully updated your reservation at #{@reservation.restaurant.name}."
    else
      render :edit
    end
  end

  def destroy
    @reservation.destroy
  end

  private

  def reservation_params
    params.require(:reservation).permit(:restaurant_id, :user_id, :seating_time, :party_size)
  end

  def get_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def get_reservation
    @reservation = @restaurant.reservations.find(params[:id])
  end
end
