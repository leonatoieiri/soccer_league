class Match < ApplicationRecord
  validates :home_team_score, :visitor_team_score, :winner, :status,
    presence: true
  validates :home_team_score, :visitor_team_score,
    numericality: { greater_than_or_equal_to: 0 }
  validate :different_teams

  belongs_to :competition
  belongs_to :group, optional: true
  belongs_to :home_team, class_name: 'Team', foreign_key: 'home_team_id'
  belongs_to :visitor_team, class_name: 'Team', foreign_key: 'visitor_team_id'

  enum winner: { draw: 0, home_team: 1, visitor_team: 2 }
  enum status: { plan: 0, ongoing: 1, done: 2 }

  # Points: matches for double round robin competitions
  # Groups: matches for groups stage of groups competitions
  # Elimination: matches after group stage for group competitions
  enum tournament_stage: { points: 0, groups: 1, elimination: 2 }

  before_save :set_winner
  after_save :update_points
  after_save :update_bracket

  def set_score match
    self.home_team_score = match["home_team_score"]
    self.visitor_team_score = match["visitor_team_score"]
    self.status = :done
    self.save
  end

  def winner_team
    self.winner == "home_team" ? self.home_team : self.visitor_team
  end

  def loser_team
    self.winner == "home_team" ? self.visitor_team : self.home_team
  end

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

  def update_points
    if self.done? and (self.points? or self.groups?)
      if self.points?
        home_team = CompetitionTeam.find_by(
          competition_id: self.competition_id, team_id: self.home_team_id)
        visitor_team = CompetitionTeam.find_by(
          competition_id: self.competition_id, team_id: self.visitor_team_id)
      else
        home_team = GroupTeam.find_by(group_id: self.group_id,
          team_id: self.home_team_id)
        visitor_team = GroupTeam.find_by(group_id: self.group_id,
          team_id: self.visitor_team_id)
      end
      goal_difference = self.home_team_score - self.visitor_team_score
      home_team.goal_difference += goal_difference
      visitor_team.goal_difference -= goal_difference

      if self.draw?
        home_team.points += 1
        visitor_team.points += 1
      elsif self.home_team?
        home_team.points += 3
      else
        visitor_team.points += 3
      end

      home_team.save
      visitor_team.save

      if self.points?
        CompetitionResultsUpdateJob.perform_now(self.competition_id)
      else
        GroupResultsUpdateJob.perform_now(self.group_id)
      end
    end
  end

  def update_bracket
    if self.done? and self.elimination?
      winner_team_id = self.winner == "home_team" ? self.home_team_id : self.visitor_team_id
      bracket = Bracket.find_by(match_id: self.id)
      if bracket.blank?
        return
      end
      bracket.done!
      next_bracket = Bracket.find_by(competition_id: self.competition_id,
        home_team_origin_type: :home_bracket,
        home_team_origin_id: bracket.id)
      if next_bracket.present?
        next_bracket.home_team_id = winner_team_id
        next_bracket.save
      end
      if next_bracket.blank?
        next_bracket = Bracket.find_by(
          competition_id: self.competition_id,
          visitor_team_origin_type: :home_bracket,
          visitor_team_origin_id: bracket.id)
        if next_bracket.present?
          next_bracket.visitor_team_id = winner_team_id
          next_bracket.save
        end
      end
      if bracket.round == 2
        self.competition.done!
      end
    end
  end

  def different_teams
    if home_team_id == visitor_team_id
      errors.add(:visitor_team, "A team can't play agains itself")
    end
  end
end
