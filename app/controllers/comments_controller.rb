class CommentsController < ApplicationController

  before_action :load_commentable

  def index
    #redirrect back to post not to show comments
    @post = Post.find(params[:post_id])
    redirect_to @post
  end

  def new
    @comment = @commentable.comments.new
  end

  def create
    @comment = @commentable.comments.new comment_params
    if @comment.save
      redirect_to @commentable, notice: "Comment created." 
    else
      render :new
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:content)
    end

  def load_commentable
    resource, id = request.path.split('/')[1,2]
    @commentable = resource.singularize.classify.constantize.find(id)
  end
end
