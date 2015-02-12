require 'rails_helper'

RSpec.feature 'Managing list' do
  scenario 'Create new list' do

    list = List.create!(name: 'Whomp')

    breaking = Show.create!(name: 'Breaking Bad', artwork: 'http://thetvdb.com/banners/_cache/posters/81189-10.jpg', description: "Mild-.")

    season = Season.create(number: 1)
    episode = Episode.create!(number: 1, length: 42)
    breaking.seasons << season
    season.episodes << episode
    breaking.episodes << episode

    visit '/'

    click_on 'NEW QUEUE'

    fill_in 'Name', :with => 'Test'

    click_on 'Create List'


    expect(page).to have_content 'TEST'
  end



  scenario 'Add show to list' do

    list = List.create!(name: 'Test')

    breaking = Show.create!(name: 'Breaking Bad', artwork: 'http://thetvdb.com/banners/_cache/posters/81189-10.jpg', description: "Mild-.")

    season = Season.create(number: 1)
    episode = Episode.create!(number: 1, length: 42)
    breaking.seasons << season
    season.episodes << episode
    breaking.episodes << episode

    visit '/shows'

    click_on 'Add to TEST'


    expect(page.find('h6')).to have_content(/successfully/i)
  end

  scenario 'View a list' do

    list = List.create!(name: 'Test')

    breaking = Show.create!(name: 'Breaking Bad', artwork: 'http://thetvdb.com/banners/_cache/posters/81189-10.jpg', description: "Mild-.")

    season = Season.create(number: 1)
    episode = Episode.create!(number: 1, length: 42)
    breaking.seasons << season
    season.episodes << episode
    breaking.episodes << episode

    visit ("/lists/#{list.id}")


    expect(page).to have_content('TEST')
  end

  scenario 'Create new list' do

    list = List.create!(name: 'Whomp')

    visit "/lists/#{list.id}"

    click_on 'DELETE QUEUE'


    expect(page.find('h6')).to have_content(/successfully/i)
  end
end
