require Rails.root.join('lib', 'rails_admin', 'matches.rb')
RailsAdmin::Config::Actions.register(RailsAdmin::Config::Actions::Matches)
require Rails.root.join('lib', 'rails_admin', 'teams.rb')
RailsAdmin::Config::Actions.register(RailsAdmin::Config::Actions::Teams)
require Rails.root.join('lib', 'rails_admin', 'brackets.rb')
RailsAdmin::Config::Actions.register(RailsAdmin::Config::Actions::Brackets)
require Rails.root.join('lib', 'rails_admin', 'results.rb')
RailsAdmin::Config::Actions.register(RailsAdmin::Config::Actions::Results)
require Rails.root.join('lib', 'rails_admin', 'simulator.rb')
RailsAdmin::Config::Actions.register(RailsAdmin::Config::Actions::Simulator)

RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    matches
    teams
    brackets
    results
    simulator

    ## With an audit adapter, you can add:
    # history_index
    # history_show

    config.excluded_models = ["Match", "CompetitionTeam", "GroupTeam", "Bracket", "Group"]
  end

  config.model 'Competition' do
    list do
      field :name
      field :year
      field :tournament_format
    end
  end

  config.model 'Player' do
    list do
      configure :created_at do
        hide
      end
      configure :updated_at do
        hide
      end
    end
  end

  config.model 'Team' do
    list do
      configure :created_at do
        hide
      end
      configure :updated_at do
        hide
      end
    end
  end
end
