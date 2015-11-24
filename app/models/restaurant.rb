class Restaurant < ActiveRecord::Base
  belongs_to :owner, class_name: "User", foreign_key: "user_id"
  has_many :reservations
  has_many :reviews
  belongs_to :category
  validates :name, presence:true
  validates :name, uniqueness: { case_sensitive: false,  scope: [:street_number, :street_name, :city, :province, :country] }
  geocoded_by :full_address   # can also be an IP address
  after_validation :geocode          # auto-fetch coordinates

  def is_owned_by?(user)
  	owner == user
  end

  def full_address
  		"#{street_number} #{street_name}, #{city}, #{province}, #{country}"
  		
  end

end
