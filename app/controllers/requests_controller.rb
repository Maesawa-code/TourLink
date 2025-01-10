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
    message = params[:message]
    @request = Request.find(params[:id])
    @request.update(status: 'approved')
    create_notification(@request.user, @request.post, message)
    redirect_to post_path(@request.post), notice: 'リクエストを承認しました。'
  end

  def reject
    message = params[:message]
    @request = Request.find(params[:id])
    @request.update(status: 'rejected')
    create_notification(@request.user, @request.post, message)
    redirect_to post_path(@request.post), notice: 'リクエストを拒否しました。'
  end

  private

  def create_notification(user, post, message)
    Notification.create(
      user: user, 
      post: post,
      message: message,
      read_status: false
      )
  end
end
