Rails.application.routes.draw do

  devise_for :users
  resources :users do

       resources :invitations

  end
  resources :categories
  resources :aposts

   root to: "aposts#index"
  get 'my_friends', to: "users#my_friends"
  get 'my_invitations', to: "invitations#my_invitations"
  get 'myposts', to: "aposts#myposts"

patch 'invitation' ,to: "invitations#update"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
