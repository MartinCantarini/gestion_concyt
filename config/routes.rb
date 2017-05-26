Rails.application.routes.draw do

  devise_for :users, :controllers => { registrations: 'users/registrations' }
  resources :users
  resources :posters
  root 'others#home'
  #get '/render_poster/:id', :to => 'posters#render_poster', :as => 'render_poster'
  get '/posters/:id/render', :to => 'posters#render_poster', :as => 'render_poster'
  get '/posters/:id/finalizar', :to => 'posters#finalizar_poster', :as => 'finalizar_poster'
  get 'others/proximamente'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
