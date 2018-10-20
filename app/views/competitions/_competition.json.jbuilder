json.extract! competition, :id, :name, :year, :tournament_format, :status, :start_date, :end_date, :created_at, :updated_at
json.url competition_url(competition, format: :json)
