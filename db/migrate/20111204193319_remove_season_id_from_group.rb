class RemoveSeasonIdFromGroup < ActiveRecord::Migration
  def up
    remove_column :groups, :season_id
  end

  def down
    add_column :groups, :season_id, :integer
  end
end
