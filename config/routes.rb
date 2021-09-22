Rails.application.routes.draw do
  devise_for :users
  root to: 'search#new', as: :home
  get '/search', to: 'search#index'
  post '/search', to: 'search#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
