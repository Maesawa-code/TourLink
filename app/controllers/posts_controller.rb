class PostsController < ApplicationController
  def index
    if user_signed_in?
      @posts = Post.all.order(created_at: :desc)
      render :index
    else
      redirect_to top_screen_index_path
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user

    if @post.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:title, :bike_genre_id, :engine_capacity_id, :prefecture_id, :note, :scheduled_date)
  end
end
