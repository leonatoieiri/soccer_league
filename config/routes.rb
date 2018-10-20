Rails.application.routes.draw do
  resources :matches
  resources :competition_teams
  resources :competitions
  resources :players
  resources :teams
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  get "/generate_matches/:id" => 'competitions#generate_matches', as: 'generate_matches'
end
