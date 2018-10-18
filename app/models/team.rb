class Team < ApplicationRecord
  validates :name, presence: true

  has_many :players
  has_many :competition_teams
  has_many :competitions, through: :competition_teams

  enum status: { inactive: 0, active: 1 }
end
