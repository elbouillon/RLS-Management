class CreateGroupsSeasons < ActiveRecord::Migration
  def change
    create_table :groups_seasons do |t|
      t.integer :group_id
      t.integer :season_id

      t.timestamps
    end
  end
end
