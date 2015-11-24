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
		        marker.infowindow restaurant.name
		        marker.picture({
                  :picture => "http://www.google.com/intl/en_us/mapfiles/ms/micons/blue-dot.png",
                  :width   => 32,
                  :height  => 32
                 })
	  			end
  	end
  end
end
