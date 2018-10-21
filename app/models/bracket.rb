class Bracket < ApplicationRecord
  belongs_to :competition
  belongs_to :match, optional: true
  belongs_to :home_team, class_name: 'Team', foreign_key: 'home_team_id',
    optional: true
  belongs_to :visitor_team, class_name: 'Team', foreign_key: 'visitor_team_id',
    optional: true


  enum home_team_origin_type: { home_bracket: 0, home_group: 1 }
  enum visitor_team_origin_type: { visitor_bracket: 0, visitor_group: 1 }
  enum status: { plan: 0, ongoing: 1, done: 2 }
end
