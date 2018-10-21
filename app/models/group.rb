class Group < ApplicationRecord
  validates :name, presence: true

  belongs_to :competition
  has_many :group_teams
  has_many :teams, through: :group_teams
  has_many :matches

  enum status: { plan: 0, ongoing: 1, done: 2 }
end
