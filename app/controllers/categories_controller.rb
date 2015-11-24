class CategoriesController < ApplicationController

  def index
  	@categories = Category.all
  	@restaurants = Restaurant.all.order(name: :asc)
  	if params[:query]
  		@category = Category.find(params[:query])
  		@restaurants = @category.restaurants
		    @hash = Gmaps4rails.build_markers(@restaurants) do |restaurant, marker|
		        marker.lat restaurant.latitude
		        marker.lng restaurant.longitude
		        marker.infowindow restaurant.summary
	  			end
  	end
  end
end
