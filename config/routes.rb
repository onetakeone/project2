Rails.application.routes.draw do
  root 'posts#index'
  get 'comments/index'
  get 'comments/new'
  get 'pages/user'
  
  devise_for :users
  resources :posts do
    resources :comments
  end
  resources :places do
    resources :comments
  end

 resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
