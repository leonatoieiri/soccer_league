json.extract! competition, :id, :name, :year, :format, :status, :created_at, :updated_at
json.url competition_url(competition, format: :json)
