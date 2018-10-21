class CompetitionResultsUpdateJob < ApplicationJob
  queue_as :default

  def perform(competition_id)
    comp_teams = CompetitionTeam.where(competition_id: competition_id)
      .order(points: :desc, goal_difference: :desc)
    comp_teams.each_with_index do |team, index|
      team.update(place: index + 1)
    end
  end
end
