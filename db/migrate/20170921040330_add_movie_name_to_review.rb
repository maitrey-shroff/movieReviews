class AddMovieNameToReview < ActiveRecord::Migration[5.1]
  def change
    add_column :reviews, :movie_name, :string
  end
end
