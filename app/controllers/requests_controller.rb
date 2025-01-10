class RequestsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @request = @post.requests.new(user: current_user, status: 'pending')

    if @request.save
      redirect_to post_path(@post), notice: '参加希望を送信しました。'
    else
      redirect_to post_path(@post)
    end
  end
end
