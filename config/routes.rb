Rails.application.routes.draw do



  resources :categories
  resources :aposts
  resources :allposts
   root to: "aposts#index"
  devise_for :users
  get 'myposts', to: "aposts#myposts"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
