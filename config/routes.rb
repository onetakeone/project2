Rails.application.routes.draw do
  resources :places
  get 'comments/index'
  get 'comments/new'
  get 'pages/user'
  root 'posts#index'
  devise_for :users
  resources :posts do
    resources :comments
  end
  resources :places do
    resources :comments
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
