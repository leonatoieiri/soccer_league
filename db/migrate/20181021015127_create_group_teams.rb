class CreateGroupTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :group_teams do |t|
      t.integer :group_id
      t.integer :team_id
      t.integer :points, default: 0
      t.integer :goal_difference, default: 0
      t.integer :place, default: 1

      t.timestamps
    end
  end
end
