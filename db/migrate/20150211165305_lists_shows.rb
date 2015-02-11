class ListsShows < ActiveRecord::Migration
  def change
    create_table :lists_shows, id: false do |t|
      t.belongs_to :list, index: true
      t.belongs_to :show, index: true
    end
  end
end
