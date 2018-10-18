json.extract! competition_team, :id, :competition_id, :team_id, :points, :goal_difference, :place, :created_at, :updated_at
json.url competition_team_url(competition_team, format: :json)
