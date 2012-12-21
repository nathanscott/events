Events::Application.routes.draw do
  devise_for :users

  resources :comments
  resources :posts
  resources :users
  
  root :to => "posts#index"
  
end
