class CreateCompetitions < ActiveRecord::Migration[5.2]
  def change
    create_table :competitions do |t|
      t.string :name
      t.integer :year
      t.integer :tournament_format, default: 0
      t.integer :status, default: 0
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
