# lib/rails_admin/matches.rb

module RailsAdmin
  module Config
    module Actions
      class Results < RailsAdmin::Config::Actions::Base
        # This ensures the action only shows up for Users
        register_instance_option :visible? do
          authorized? && bindings[:abstract_model].param_key == "competition" && bindings[:object].done?
        end

        # We want the action on members, not the Users collection
        register_instance_option :member do
          true
        end
        register_instance_option :link_icon do
          'fa fa-trophy'
        end
        # You may or may not want pjax for your action
        register_instance_option :pjax? do
          false
        end

        register_instance_option :controller do
          Proc.new do
            @results = []
            if @object.groups?
              final_match = @object.brackets.find_by(round: 2).match
              @results << final_match.winner_team
              @results << final_match.loser_team

              semi_finals = @object.brackets.where(round: 4)
              semi_finals.each do |semi_final|
                @results << semi_final.match.loser_team
              end
            else
              @comp_teams = @object.competition_teams.order(place: :asc)
              @comp_teams.each do |comp_team|
                @results << comp_team.team
              end
            end
          end
        end
      end
    end
  end
end
