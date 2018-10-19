json.extract! match, :id, :competition_id, :group_id, :home_team_id, :visitor_team_id, :home_team_score, :visitor_team_score, :winner, :status, :created_at, :updated_at
json.url match_url(match, format: :json)
