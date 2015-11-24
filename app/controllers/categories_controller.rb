class CategoriesController < ApplicationController

  def index
  	@categories = Category.all
  	@restaurants = Restaurant.all.order(name: :asc)
  	if params[:query]
  		@category = Category.find(params[:query])
  		@restaurants = @category.restaurants
  	end
  end
end
