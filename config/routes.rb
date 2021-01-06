Rails.application.routes.draw do



  resources :categories
  resources :aposts
  resources :invitations
   root to: "aposts#index"
  devise_for :users

  get 'myposts', to: "aposts#myposts"
  get 'requests', to: "invitations#show"
  patch  '/invitations/:id', to: "invitations#update" ,as:"update_inv"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
