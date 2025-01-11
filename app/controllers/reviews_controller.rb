class ReviewsController < ApplicationController
before_action :set_review, only: [:edit, :update, :destroy]
  def index
    @reviews = Review.all.order(created_at: :desc)
  end

  def new
    @review = current_user.reviews.build
  end

  def create
    @review = current_user.reviews.build(review_params)
    if @review.save
      redirect_to user_reviews_path(current_user)
    else
      puts @review.errors.full_messages
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @review = Review.find(params[:id])
  end

  def edit
  end

  def update
    if @review.update(review_params)
      redirect_to user_reviews_path(current_user)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @review.destroy
      redirect_to user_reviews_path(current_user)
    else
      render :show
    end
  end
  private

  def set_review
    @review = current_user.reviews.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:title, :rating, :comment, :image)
  end
end
