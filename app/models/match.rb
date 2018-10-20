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

  before_save :set_winner
  after_save :update_competition

  def set_winner
    if self.done?
      if self.home_team_score > self.visitor_team_score
        self.winner = :home_team
      elsif self.visitor_team_score > self.home_team_score
        self.winner = :visitor_team
      else
        self.winner = :draw
      end        
    end
  end

  def update_competition
    if self.done?
      comp_home_team = CompetitionTeam.find_by(
        competition_id: self.competition_id, team_id: self.home_team_id)
      comp_visitor_team = CompetitionTeam.find_by(
        competition_id: self.competition_id, team_id: self.visitor_team_id)
      goal_difference = self.home_team_score - self.visitor_team_score
      comp_home_team.goal_difference += goal_difference
      comp_visitor_team.goal_difference -= goal_difference

      if self.draw?
        comp_home_team.points += 1
        comp_visitor_team.points += 1
      elsif self.home_team?
        comp_home_team.points += 3
      else
        comp_visitor_team.points += 3
      end

      comp_home_team.save
      comp_visitor_team.save
    end
  end

  def different_teams
    if home_team_id == visitor_team_id
      errors.add(:visitor_team, "A team can't play agains itself")
    end
  end
end
