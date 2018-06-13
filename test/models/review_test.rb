require 'test_helper'

class ReviewTest < ActiveSupport::TestCase

  test 'valid review' do
    review = Review.new(email_address: 'john@example.com', rating: '10')
    assert review.valid?, 'review valid with email address and rating'
  end

  test 'invalid review without email address' do
    review = Review.new(rating: '14')
    assert review.invalid?, 'review invalid without email address'
  end

  test 'invalid without rating' do
    review = Review.new(email_address: 'john@example.com')
    assert review.invalid?, 'review invalid without rating'
  end

end
