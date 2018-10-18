class Team < ApplicationRecord
  validates :name, presence: true

  has_many :players

  enum status: { inactive: 0, active: 1 }
end
