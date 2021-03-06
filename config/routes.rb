Rails.application.routes.draw do
  get 'contacts/new'
  get 'contacts/create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  namespace :admin do
    resources :users
  end
  
  root to: 'bbs#index'
  resources :bbs
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
