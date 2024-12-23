class ReviewsController < ApplicationController

  def index
    @reviews = current_user.reviews.order(created_at: :desc)
  end

  def new
    @review = current_user.reviews.build
  end

  def create
    @review = current_user.reviews.build(review_params)
    if @review.save
      redirect_to user_reviews_path(current_user), notice: 'レビューが投稿されました。'
    else
      puts @review.errors.full_messages
      render :new, status: :unprocessable_entity
    end
  end

  private
  def review_params
    params.require(:review).permit(:title, :rating, :comment, :image)
  end
end
