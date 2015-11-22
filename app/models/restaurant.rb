class Restaurant < ActiveRecord::Base
  belongs_to :owner, class_name: "User", foreign_key: "user_id"
  has_many :reservations
  has_many :reviews
  validates :name, presence:true
  validates :name, uniqueness: { case_sensitive: false,  scope: [:street_number, :street_name, :city, :province, :country] }

  def is_owned_by?(user)
  	owner == user
  end
end
