class AddListsToShows < ActiveRecord::Migration
  def change
    add_reference :shows, :list, index: true
    add_foreign_key :shows, :lists
  end
end
