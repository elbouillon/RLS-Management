class CreateSeasons < ActiveRecord::Migration
  def change
    create_table :seasons do |t|
      t.string :name
      t.date :start_on
      t.date :end_on

      t.timestamps
    end
  end
end
