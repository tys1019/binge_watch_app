class AddWatchedToEpisodes < ActiveRecord::Migration
  def change
    add_column :episodes, :watched, :boolean, default: false, null: false
  end
end
