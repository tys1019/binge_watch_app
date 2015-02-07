require 'rails_helper'

RSpec.feature 'Managing shows' do
  # scenario 'Welcome page shows all the TV shows' do
  #   Show.create!(name: 'Breaking Bad', artwork: 'http://thetvdb.com/banners/_cache/posters/81189-10.jpg', description: "Mild-.")

  #   visit '/'

  #   expect(page).to have_selector 'section'
  # end

  scenario 'Show all TV shows and episodes' do
    breaking = Show.create!(name: 'Breaking Bad', artwork: 'http://thetvdb.com/banners/_cache/posters/81189-10.jpg', description: "Mild-.")
        1.upto(5) do |i|
       breaking.seasons << Season.create!(number: i)
    end

    breaking.seasons.each do |season|
      1.upto(12) do |i|
         episode = Episode.create!(number: i, length: 42)
         season.episodes << episode
         breaking.episodes << episode
      end
    end

    visit '/shows'

    expect(page).to have_selector 'section'
    expect(page).to have_selector 'episode'
  end
end
