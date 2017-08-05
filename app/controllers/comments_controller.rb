class CommentsController < ApplicationController
  def index
    @commentable = Post.find(params[:post_id])
    @comments = @commentable.comments
  end

  def new
  end
end
