class RemoveShowIdFromEpisodes < ActiveRecord::Migration
  def change
    remove_column :episodes, :show_id, :string
  end
end
