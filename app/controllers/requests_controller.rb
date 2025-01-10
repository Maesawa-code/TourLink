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

  def approve
    @request = Request.find(params[:id])
    @request.update(status: 'approved')
    redirect_to post_path(@request.post), notice: 'リクエストを承認しました。'
  end

  def reject
    @request = Request.find(params[:id])
    @request.update(status: 'rejected')
    redirect_to post_path(@request.post), notice: 'リクエストを拒否しました。'
  end

  private

  def create_notification(user, message)
    Notification.create(user: user, message: message)
  end
end
