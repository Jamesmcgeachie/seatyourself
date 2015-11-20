class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :restaurant
  validates :party_size, :seating_time, presence: true 
  validates :party_size, numericality: {only_integer: true, greater_than_or_equal_to: 2, less_than_or_equal_to: 20}
  validate :seating_time_cannot_be_in_the_past

  def seating_time_cannot_be_in_the_past
  	if  seating_time.present?  
  		errors.add(:seating_time, "reservation can't be in the past") if seating_time < Date.today
      	errors.add(:seating_time, "reservation should be on the hour") if seating_time.min != 0
      	errors.add(:seating_time, "reservation should be between 11am and 8pm") if !(seating_time.hour).between?(11,20) 
  	end
  end 

end
