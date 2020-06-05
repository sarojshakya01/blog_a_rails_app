Rails.application.routes.draw do
  resources :comments
  devise_for :users
  resources :posts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/users", to: "users#index"
  get "/", to: "posts#index"
  get "/user/posts", to: "users#posts"
  get "/pendingposts", to: "posts#pending"
end
