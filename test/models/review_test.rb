require 'test_helper'

class ReviewTest < ActiveSupport::TestCase

  test 'valid review' do
    review = Review.new(email_address: 'john@example.com', rating: '10')
    assert review.valid?
  end

  test 'invalid review without email address' do
    review = Review.new(rating: '10')
    assert review.invalid?
  end

  test 'invalid without rating' do
    review = Review.new(email_address: 'john@example.com')
    assert review.invalid?
  end

end
