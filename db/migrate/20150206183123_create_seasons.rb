class CreateSeasons < ActiveRecord::Migration
  def change
    create_table :seasons do |t|
      t.string :number
      t.belongs_to :show, index: true
    end
    add_foreign_key :seasons, :shows
  end
end
