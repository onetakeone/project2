class PagesController < ApplicationController
  
  def admin
    @user = current_user
    @posts = Post.all
    @places = Place.all
  end

end
