class Competition < ApplicationRecord
  validates :name, presence: true

  has_many :competition_teams
  has_many :teams, through: :competition_teams

  # Double Round Robin: every team plays each other twice in a single big group
  # Groups: Teams are assigned groups, the best team(s) in each group
  # advance to a single round robin stage
  enum format: { double_rr: 0, groups: 1 }
  enum status: { plan: 0, ongoing: 1, done: 2 }
end
