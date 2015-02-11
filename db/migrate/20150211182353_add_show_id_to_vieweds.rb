class AddShowIdToVieweds < ActiveRecord::Migration
  def change
    add_reference :vieweds, :show, index: true
    add_foreign_key :vieweds, :shows
  end
end
