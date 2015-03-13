Rails.application.routes.draw do
  devise_for :users
  
  resources :posts, path: "forum" do
  	resources :comments, path: "post"
  end

  root 'posts#index'
end
