class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # Loads devise before any action
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters  
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:username])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username])

    # Creates objects for devise user profile page. Objects are used to show user's posts and places  
    @places = Place.all
    @posts = Post.all
  end
  


end
