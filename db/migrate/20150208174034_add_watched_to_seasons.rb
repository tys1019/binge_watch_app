class AddWatchedToSeasons < ActiveRecord::Migration
  def change
    add_column :seasons, :watched, :boolean, default: false, null: false
  end
end
