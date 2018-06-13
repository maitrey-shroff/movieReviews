class Review < ApplicationRecord
  validates :email_address, :rating, :movie_id, :movie_name, presence: true
  validates_inclusion_of :rating, :in => 1..10
end
