class CreateBrackets < ActiveRecord::Migration[5.2]
  def change
    create_table :brackets do |t|
      t.integer :match_id
      t.integer :round, default: 2
      t.integer :home_team_origin_type, default: 0
      t.integer :visitor_team_origin_type, default: 0
      t.integer :home_team_origin_id
      t.integer :visitor_team_origin_id
      t.integer :home_team_id
      t.integer :visitor_team_id
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
