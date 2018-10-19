Rails.application.routes.draw do
  resources :matches
  resources :competition_teams
  resources :competitions
  resources :players
  resources :teams
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
