Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show] do
    resources :ideas
  end

  get '/login', to: 'sessions#new'
  get '/signup', to: 'users#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  namespace :admin do
    resources :categories, only: [:index, :new, :create, :destroy]
  end
end
