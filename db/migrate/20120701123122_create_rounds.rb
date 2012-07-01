class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.string :name
      t.integer :leg
      t.integer :cup_id

      t.timestamps
    end
  end
end
