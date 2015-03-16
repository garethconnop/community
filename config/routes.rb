Rails.application.routes.draw do
 
  devise_for :users

  devise_scope :user do
    get 'join', to: 'devise/registrations#new', as: :join
    get 'sign-in', to: 'devise/sessions#new', as: :sign_in
    delete 'sign-out' => 'devise/sessions#destroy', :as => :sign_out
  end

  resources :posts, path: "forum" do
  	resources :comments, path: "post"
  end

  root 'posts#index'
end
