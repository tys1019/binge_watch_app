class CreateEpisodes < ActiveRecord::Migration
  def change
    create_table :episodes do |t|
      t.string :name
      t.integer :number
      t.integer :length
      t.belongs_to :season, index: true
    end
    add_foreign_key :episodes, :seasons
  end
end
