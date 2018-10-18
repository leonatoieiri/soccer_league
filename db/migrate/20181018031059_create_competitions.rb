class CreateCompetitions < ActiveRecord::Migration[5.2]
  def change
    create_table :competitions do |t|
      t.string :name
      t.integer :year
      t.integer :format, default: 0
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
