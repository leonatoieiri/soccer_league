class GroupResultUpdateJob < ApplicationJob
  queue_as :default

  def perform(group_id)
    group_teams = GroupTeam.where(group_id: group_id)
      .order(points: :desc, goal_difference: :desc)
    group_teams.each_with_index do |team, index|
      team.update(place: index + 1)
    end
  end
end
