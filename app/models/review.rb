class Review < ApplicationRecord
  validates :email_address, :rating, presence: true
end
