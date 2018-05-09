Rails.application.routes.draw do

  devise_for :users, controllers: {registrations: "registrations"}
  resources :events
  root to: 'home#index'
  get '/events/:id/suscribe', to: 'events#suscribe', as: 'suscribe'
  get '/users/:id/show', to: 'users#show', as: 'user_show'

  resources :charges, only: [:new, :create]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
