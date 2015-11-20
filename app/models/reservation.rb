class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :restaurant
  validates :party_size, :seating_time, presence: true 
  validates :party_size, numericality: {only_integer: true, greater_than_or_equal_to: 2, less_than_or_equal_to: 20}
end
