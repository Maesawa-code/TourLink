class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.user = current_user
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
