class Match < ApplicationRecord
  validates :home_team_score, :visitor_team_score, :winner, :status,
    presence: true
  validates :home_team_score, :visitor_team_score,
    numericality: { greater_than_or_equal_to: 0 }
  validate :different_teams

  belongs_to :competition
  belongs_to :home_team, class_name: 'Team', foreign_key: 'home_team_id'
  belongs_to :visitor_team, class_name: 'Team', foreign_key: 'visitor_team_id'

  enum winner: { draw: 0, home_team: 1, visitor_team: 2 }
  enum status: { plan: 0, ongoing: 1, done: 2 }

  def different_teams
    if home_team_id == visitor_team_id
      errors.add(:visitor_team, "A team can't play agains itself")
    end
  end
end
