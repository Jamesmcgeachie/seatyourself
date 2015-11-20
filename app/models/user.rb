class User < ActiveRecord::Base

	has_secure_password

	has_many :reservations
	has_one :owned_restaurant, class_name: "Restaurant"
	validates :email, uniqueness: true
	validates :first_name, :last_name, :email, presence: true
end
