class AddCompetitionIdToBrackets < ActiveRecord::Migration[5.2]
  def change
    add_column :brackets, :competition_id, :integer
  end
end
