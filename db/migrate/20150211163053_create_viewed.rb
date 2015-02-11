class CreateViewed < ActiveRecord::Migration
  def change
    create_table :vieweds do |t|
      t.belongs_to :list, index: true
      t.belongs_to :episode, index: true
      t.boolean :viewed, default: false, null: false
    end
    add_foreign_key :vieweds, :lists
    add_foreign_key :vieweds, :episodes
  end
end
