class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.integer :competition_id
      t.integer :order, default: 0
      t.string :name
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
