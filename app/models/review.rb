class Review < ApplicationRecord
  validates :email_address, :rating, presence: true
  validates :rating, :inclusion => 0..10
end
