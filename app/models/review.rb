class Review < ActiveRecord::Base
  belongs_to :restaurant
  belongs_to :user

  def written_by?(user)
  	user == self.user
  end
end
