class ReviewsController < ApplicationController

  # Method used to display all reviews
  def index
    @reviews = Review.all
  end

  # Method used to show reviews for a specific movie
  def show
    @movie_id = params[:movie_id]

    @reviews = Review.where(movie_id: @movie_id)
    if @reviews.length > 0
      render :index
    else
      redirect_to "/"
      flash[:danger] = "This movie does not have any reviews yet."
    end
  end

  # Method used to create a new review
  def new
    @review = Review.new
    @movie_id = params[:movie_id]
    @movie_name = params[:movie_name]
  end

  # Method used to save a new review to the database
  def create
    @review = Review.create({movie_id: params[:movie_id], movie_name: params[:movie_name], email_address: params[:email_address], review_date: params[:review_date], rating: params[:rating], comment: params[:comment]})
    if @review.save
      redirect_to "/revues"
    else
      redirect_to request.referrer
      flash[:danger] = "Please fill in a valid response for all required fields"
    end
  end

end