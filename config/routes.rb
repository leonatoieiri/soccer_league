Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  root to: 'rails_admin/main#dashboard'

  # AJAX routes
  get "/generate_matches/:id" => 'competitions#generate_matches', as: 'generate_matches'
  post "/update_score/:id" => 'matches#update_score', as: 'update_score'
  post "/simulate/:id" => 'competitions#simulate', as: 'competition_simulate'
end
