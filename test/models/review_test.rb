require 'test_helper'

class ReviewTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "new review" do
  	assert equal 1, Review.count
  end
end
