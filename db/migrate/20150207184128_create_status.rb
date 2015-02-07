class CreateStatus < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.boolean :watched, default: false, null: false
      t.belongs_to :list, index: true
      t.belongs_to :episode, index: true
    end
    add_foreign_key :statuses, :lists
    add_foreign_key :statuses, :episodes
  end
end
