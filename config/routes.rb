Rails.application.routes.draw do
  resources :images, only: [:new, :create, :add_to_top] do
    member do
      get '/add_to_top', action: :add_to_top
    end
  end
  resources :categories
  mount Upmin::Engine => '/admin'
  devise_for :users
  resources :users
  get '/top', to: 'categories#show', as: :top, id: :top
  get '/oczekujace', to: 'categories#show', as: :oczekujace, id: :oczekujace
  get '/random_image', to: 'images#random_image', as: :random_image
  root to: 'categories#show', id: :top
end
