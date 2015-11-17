class User < ActiveRecord::Base
	has_many :reservations
	has_one :owned_restaurant, class_name: "Restaurant"

end
