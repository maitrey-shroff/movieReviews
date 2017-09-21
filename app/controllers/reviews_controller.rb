class ReviewsController < ApplicationController
  def home
  end

  def index
    @reviews = Review.all
  end

  def new
    @review = Review.new
    @movie_id = params[:movie_id]
    @movie_name = params[:movie_name]
  end

  def create
    @review = Review.create({movie_id: params[:movie_id], movie_name: params[:movie_name], email_address: params[:email_address], review_date: params[:review_date], rating: params[:rating], comment: params[:comment]})
    redirect_to "/revues"
  end

  def show
    @movie_id = params[:movie_id]

    # @reviews = Review.where("movie_id ILIKE ?", "#{@movie_id}")
    @reviews = Review.where(movie_id: @movie_id)

    render :index
  end

end