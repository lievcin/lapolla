class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.datetime :kickoff
      t.integer :home_score
      t.integer :away_score
      t.integer :round_id
      t.integer :home_team
      t.integer :away_team

      t.timestamps
    end
  end
end
