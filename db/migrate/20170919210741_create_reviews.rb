class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.integer :movie_id
      t.string :email_address
      t.date :review_date
      t.integer :rating
      t.string :comment

      t.timestamps
    end
  end
end
