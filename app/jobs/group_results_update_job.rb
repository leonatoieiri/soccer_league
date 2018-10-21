class GroupResultsUpdateJob < ApplicationJob
  queue_as :default

  def perform(group_id)
    group_teams = GroupTeam.where(group_id: group_id)
      .order(points: :desc, goal_difference: :desc)
    group_teams.each_with_index do |team, index|
      team.update(place: (index + 1))
    end
    matches = Match.where(group_id: group_id).where.not(status: :done)
    if matches.blank?
      first_place = group_teams.first.team
      bracket = Bracket.find_by(home_team_origin_type: :home_group,
        home_team_origin_id: group_id)
      if bracket.present?
        bracket.home_team_id = first_place.id
      end
      if bracket.blank?
        bracket = Bracket.find_by(visitor_team_origin_type: :visitor_group,
          visitor_team_origin_id: group_id)
        if bracket.present?
          bracket.visitor_team_id = first_place.id
        end
      end
      bracket.save unless bracket.blank?
    end
  end
end
