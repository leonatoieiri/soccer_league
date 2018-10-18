class Player < ApplicationRecord
  validates :name, presence: true

  belongs_to :team, optional: true

  enum status: { inactive: 0, active: 1 }
end
