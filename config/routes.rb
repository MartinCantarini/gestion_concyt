Rails.application.routes.draw do
  get 'posters/new_pre'
  get 'posters/join', :to =>'posters#join', as: :join_poster
  devise_for :users, :controllers => { registrations: 'users/registrations' }
  resources :users
  resources :posters
  root 'others#home'
  get '/posters/:id/render', :to => 'posters#render_poster', :as => 'render_poster'
  get '/posters/:id/finalizar', :to => 'posters#finalizar_poster', :as => 'finalizar_poster'
  get 'others/proximamente'
  get '/posters/:id/destroy', to: 'posters#destroy', as: :destroy_poster
  get '*path' => redirect('404.html')
end
