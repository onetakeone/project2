class PagesController < ApplicationController

  def show
    @user = current_user
    @posts = Post.all
    @places = Place.all
  end

end
