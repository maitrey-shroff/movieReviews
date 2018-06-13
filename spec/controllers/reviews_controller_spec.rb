require 'spec_helper'
require 'factory_girl'
require 'database_cleaner'

RSpec.describe ReviewsController, :type => :controller do

  describe "GET index" do
    DatabaseCleaner.start
    it "populates an array of reviews" do
      review = FactoryGirl.create(:review)
      get :index
      assigns(:reviews).should eq([review])
    end

    it "renders the :index view" do
      get :index
      response.should render_template :index
    end
  end

  describe "GET #show" do
    it "assigns the requested movie to @movie_id" do
      review = FactoryGirl.create(:review)
      get :show, id: review
      assigns(:review).should eq(review)
    end
    
    it "renders the #show view" do
      get :show, id: FactoryGirl.create(:review)
      response.should render_template :show
    end
  end

  describe "POST create" do
    context "with valid attributes" do
      it "creates a new review" do
        expect{
          post :create, review: FactoryGirl.attributes_for(:review)
        }.to change(Review,:count).by(1)
      end
      
      it "redirects to the new review" do
        post :create, review: FactoryGirl.attributes_for(:review)
        response.should redirect_to Review.all
      end
    end
  end

    context "with invalid attributes" do
    it "does not save the new review" do
      expect{
        post :create, review: FactoryGirl.attributes_for(:invalid_review)
      }.to_not change(Review,:count)
    end
    
    it "re-renders the new method" do
      post :create, review: FactoryGirl.attributes_for(:invalid_review)
      response.should render_template :new
    end
  end 

end