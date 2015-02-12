require 'rails_helper'
require 'byebug'

RSpec.feature 'Managing shows' do


  scenario 'Show all TV shows and episodes' do
    list = List.create!(name: 'Whomp')

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
    list = List.create!(name: 'Whomp')


    breaking = Show.create!(name: 'Breaking Bad', artwork: 'http://thetvdb.com/banners/_cache/posters/81189-10.jpg', description: "Mild-.")
    list.shows << breaking
    season = Season.create(number: 1)
    episode = Episode.create!(number: 1, length: 42)
    breaking.seasons << season
    season.episodes << episode
    breaking.episodes << episode
    v = Viewed.create!
    v.episode = episode
    v.list = list

    visit "/lists/#{list.id}"




    click_on('Mark as Watched')


    expect(page.find('h3')).to have_content 'COMPLETE'
  end
end
