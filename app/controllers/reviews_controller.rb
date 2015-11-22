class ReviewsController < ApplicationController

  before_action :get_review, only: [:show, :edit, :update, :destroy]
  before_action :get_restaurant, only: [:create]
  before_action :authenticate_user, only: [:new, :create, :update, :edit, :destroy]

  def show
  end

  def new
  end

  def create
    @review = @restaurant.reviews.build(review_params)
    @review.user = current_user
    if @review.save
      redirect_to restaurant_path(@restaurant), notice: "Review has been added to #{@restaurant.name}"
    else
      render 'restaurants/show'
    end
  end

  def edit
    user_review_authorization
  end

  def update
    user_review_authorization
    if @review.update_attributes(review_params)
      redirect_to restaurant_path(@restaurant), notice: "Successfully updated review"
    else
      render :edit
    end
  end

  def destroy
    user_review_authorization
    if @review.destroy
      flash[:notice] = "Review has been deleted"
      redirect_to restaurant_path(@restaurant)
    else
      render :edit
    end
  end

  private

  def get_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def get_review
    @review = @restaurant.reviews.find(params[:id])
  end

  def user_review_authorization
    get_review
    unless @review.user_id == current_user.id
      flash[:alert] = "Unauthorized to edit this review"
      redirect_to root_path
    end
  end

  def review_params
    params.require(:review).permit(:title, :body, :restaurant_id, :user_id)
  end

end
