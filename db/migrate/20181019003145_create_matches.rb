class CreateMatches < ActiveRecord::Migration[5.2]
  def change
    create_table :matches do |t|
      t.integer :competition_id
      t.integer :group_id
      t.integer :home_team_id
      t.integer :visitor_team_id
      t.integer :home_team_score, default: 0
      t.integer :visitor_team_score, default: 0
      t.integer :winner, default: 0
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
