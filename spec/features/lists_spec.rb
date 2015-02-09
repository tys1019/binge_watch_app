require 'rails_helper'

RSpec.feature 'Managing list' do
  scenario 'Add show to list' do

    list = List.create!

    breaking = Show.create!(name: 'Breaking Bad', artwork: 'http://thetvdb.com/banners/_cache/posters/81189-10.jpg', description: "Mild-.")

    season = Season.create(number: 1)
    episode = Episode.create!(number: 1, length: 42)
    breaking.seasons << season
    season.episodes << episode
    breaking.episodes << episode

    visit '/shows'

    click_on 'Add to Queue'


    expect(page).to have_content 'YOU HAVE'
  end
end
