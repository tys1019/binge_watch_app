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
    expect(page).to have_selector 'li.episode'
  end

  scenario 'Mark an episode as watched' do
    breaking = Show.create!(name: 'Breaking Bad', artwork: 'http://thetvdb.com/banners/_cache/posters/81189-10.jpg', description: "Mild-.")

    season = Season.create(number: 1)
    episode = Episode.create!(number: 1, length: 42)
    breaking.seasons << season
    season.episodes << episode
    breaking.episodes << episode

    visit '/shows'

    check('episode_watched')
    click_on('Update Episode')


    expect(page.find('h3')).to have_content '0'
  end

  scenario 'Mark a season as watched' do
    breaking = Show.create!(name: 'Breaking Bad', artwork: 'http://thetvdb.com/banners/_cache/posters/81189-10.jpg', description: "Mild-.")

    season = Season.create(number: 1)
    episode = Episode.create!(number: 1, length: 42)
    breaking.seasons << season
    season.episodes << episode
    breaking.episodes << episode

    visit '/shows'

    check('season_watched')
    click_on('Update Season')


    expect(page.find('h3')).to have_content '0'
  end
end
