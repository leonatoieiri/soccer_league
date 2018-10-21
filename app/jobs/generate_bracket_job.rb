class GenerateBracketJob < ApplicationJob
  queue_as :default

  def perform(competition_id)
    competition = Competition.find(competition_id)
    groups = Group.where(competition_id: competition_id).order(id: :asc)
    brackets = []
    groups.each_slice(2) do |slice|
      brackets << Bracket.create(round: groups.size,
        competition_id: competition_id,
        home_team_origin_type: :home_group,
        home_team_origin_id: slice[0].id,
        visitor_team_origin_type: :visitor_group,
        visitor_team_origin_id: slice[1].id)
    end

    competition.generate_brackets groups.size unless groups.size <= 2
  end
end
