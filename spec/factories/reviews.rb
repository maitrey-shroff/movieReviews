require 'faker'
require 'factory_girl'

# Factory used as a building block for test data

FactoryGirl.define do
  factory :review do |r|
    r.movie_id { Faker::Number.number(6)  }
    r.movie_name { Faker::Name.first_name }
    r.email_address { Faker::Name.last_name }
    r.review_date { Date.today }
    r.rating { Faker::Number.between(1, 10) }
    r.comment { Faker::Lorem.sentence(3) }
  end
end

FactoryGirl.define do
  factory :invalid_review, parent: :review do |r|
    r.rating nil
  end
end