Rails.application.routes.draw do
  
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'homes#top'
  get 'home/about' => 'homes#about'
  get 'users' => 'users#index'
  resources :users, only: [:show, :edit, :update]
  resources :books
  
end
