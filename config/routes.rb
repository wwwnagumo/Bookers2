Rails.application.routes.draw do
  devise_for :users
  root to: 'books#top'
  get '/home/about' => 'books#home'
  resources :books
  resources :users, only: [:index, :show, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
