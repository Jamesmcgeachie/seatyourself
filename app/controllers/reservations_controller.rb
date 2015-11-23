class ReservationsController < ApplicationController

  before_action :authenticate_user
  before_action :get_restaurant, only: [:new, :show, :edit, :update, :destroy, :create]
  before_action :get_reservation, only: [:show, :edit, :update, :destroy]
  before_action :user_reservation_authorization, only: [:show, :edit, :update, :destroy]

  def index
    @reservations = Reservation.where(user_id: current_user)
  end

  def show
  end


  def create
    @reservation = @restaurant.reservations.build(reservation_params)
    @reservation.user = current_user
    if @reservation.save
      redirect_to restaurant_path(@restaurant), notice: "Your reservation was successfully created!"
    else
      flash[:alert] = "Sorry, you can't make that reservation"
      render :new
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
    if @reservation.destroy
      flash[:notice] = "Reservation has been cancelled"
      redirect_to reservations_path
    else
      render :edit
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:restaurant_id, :user_id, :seating_time, :party_size)
  end

  def get_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def get_reservation
    @reservation = @restaurant.reservations.find(params[:id])
  end

  def user_reservation_authorization
    get_reservation
    unless @reservation.user_id == current_user.id
      flash[:alert] = "Unauthorized to access this reservation"
      redirect_to root_path
    end
  end

end
