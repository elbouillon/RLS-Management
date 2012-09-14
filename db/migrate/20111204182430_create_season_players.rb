class CreateSeasonPlayers < ActiveRecord::Migration
  def change
    create_table :season_players do |t|
      t.integer :season_id
      t.integer :player_id

      t.timestamps
    end
  end
end
