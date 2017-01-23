Rails.application.routes.draw do
  resources :images do
    member do
      put '/add_to_top', action: :add_to_top
    end
    resources :votes
  end
  resources :categories
  mount Upmin::Engine => '/admin'
  devise_for :users
  resources :users
  get '/top', to: 'categories#show', as: :top, id: :top
  get '/oczekujace', to: 'categories#show', as: :oczekujace, id: :oczekujace
  get '/losowy_obrazek', to: 'images#random_image', as: :random_image
  root to: 'visitors#index'
end
