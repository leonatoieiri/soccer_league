class AddTournamentStageToMatch < ActiveRecord::Migration[5.2]
  def change
    add_column :matches, :tournament_stage, :integer, default: 0
  end
end
