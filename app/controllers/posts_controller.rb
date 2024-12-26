class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authorize_user!, only: [:edit, :update, :destroy]

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
      redirect_to posts_path, notice: '投稿が作成されました。' # 投稿一覧へリダイレクト
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show; 
    @comment = Comment.new
  end

  def edit; end

  def update
    if @post.update(post_params)
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @post.destroy
      redirect_to root_path, notice: "投稿を削除しました。"
    else
      redirect_to post_path(@post), alert: "投稿の削除に失敗しました。"
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def authorize_user!
    unless @post.user == current_user
      redirect_to root_path
    end
  end

  def post_params
    params.require(:post).permit(:title, :bike_genre_id, :engine_capacity_id, :prefecture_id, :note, :scheduled_date)
  end
end
