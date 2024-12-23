class ReviewsController < ApplicationController
before_action :set_review, only: [:show, :edit, :update]
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

  def show
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
  private

  def set_review
    @review = current_user.reviews.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:title, :rating, :comment, :image)
  end
end
