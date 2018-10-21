class GroupTeam < ApplicationRecord
  belongs_to :team
  belongs_to :group

  validates :points,  numericality: { greater_than_or_equal_to: 0 }
  validates :place,  numericality: { greater_than_or_equal_to: 1 }
end
