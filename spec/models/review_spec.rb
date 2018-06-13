require 'spec_helper'
require 'factory_girl'

describe Review do
  it "has a valid factory" do
    FactoryGirl.create(:review).should be_valid
  end

  it "is invalid without an email address" do
    FactoryGirl.build(:review, movie_id: 123, movie_name: "test movie", email_address: nil, rating: "10" ).should_not be_valid
  end

  it "is invalid without a rating" do
    FactoryGirl.build(:review, movie_id: 123, movie_name: "test movie", email_address: "john@example.com", rating: nil).should_not be_valid
  end

  it "is invalid if rating is not between 1-10" do
    FactoryGirl.build(:review, movie_id: 123, movie_name: "test movie", email_address: "john@example.com", rating: "14").should_not be_valid
  end

  it "is valid with email address and rating between 1-10" do
    FactoryGirl.build(:review, movie_id: 123, movie_name: "test movie", email_address: "john@example.com", rating: "10").should be_valid
  end
end