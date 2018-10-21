class Competition < ApplicationRecord
  validates :name, presence: true

  has_many :competition_teams
  has_many :teams, through: :competition_teams
  has_many :matches
  has_many :groups

  # Double Round Robin: every team plays each other twice in a single big group
  # Groups: Teams are assigned groups, the best team(s) in each group
  # advance to a single round robin stage
  enum tournament_format: { double_rr: 0, groups: 1 }
  enum status: { plan: 0, ongoing: 1, done: 2 }

  def generate_matches
    teams = self.teams.where(status: :active).order("RANDOM()").pluck(:id)
    permutation = teams.permutation(2)
    permutation.each do |p|
      Match.find_or_create_by(competition_id: self.id,
        home_team_id: p[0], visitor_team_id: p[1])
    end
  end

  def generate_groups
    teams = self.teams.where(status: :active).order("RANDOM()").pluck(:id)
    number_of_groups = Math::log(teams.size, 2).floor
    if number_of_groups.odd?
      number_of_groups -= 1
    end
    groups = []
    (1..number_of_groups).each do |index|
      group = Group.create(competition_id: self.id, order: index,
        name: "Group #{(index + 64).chr}")
      groups << group
    end

    teams.each_with_index do |team, index|
      group_id = groups[index%number_of_groups].id
      GroupTeam.create(group_id: group_id, team_id: team)
    end

    groups.each do |group|
      teams = group.teams.pluck(:id)
      permutation = teams.permutation(2)
      permutation.each do |p|
        Match.find_or_create_by(group_id: group.id, competition_id: self.id,
          home_team_id: p[0], visitor_team_id: p[1])
      end
    end
  end
end
