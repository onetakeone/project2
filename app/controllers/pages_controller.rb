class PagesController < ApplicationController
  def index
  end
  def show
    @user = current_user
    @posts = Post.all
    @places = Place.all
  end

end
