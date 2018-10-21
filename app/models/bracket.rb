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

  before_save :create_match

  def round_name
    if self.round == 2
      'Grand finals'
    elsif self.round == 4
      'Semi finals'
    else
      "Round of #{self.round}"
    end
  end

  def home_team_name
    if self.home_team_id.present?
      self.home_team.name
    elsif self.home_bracket?
      "Winner of bracket id #{self.home_team_origin_id}"
    else
      "First place of group id #{self.home_team_origin_id}"
    end
  end

  def visitor_team_name
    if self.visitor_team_id.present?
      self.visitor_team.name
    elsif self.visitor_bracket?
      "Winner of bracket id #{self.visitor_team_origin_id}"
    else
      "First place of group id #{self.visitor_team_origin_id}"
    end
  end

  def create_match
    if self.home_team_id and self.visitor_team_id and self.match_id.blank?
      match = Match.create(competition_id: self.competition_id,
        home_team_id: self.home_team_id,
        visitor_team_id: self.visitor_team_id,
        tournament_stage: :elimination)
      self.match_id = match.id
    end
  end
end
