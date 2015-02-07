require 'rails_helper'

RSpec.feature 'Managing list' do
  scenario 'Add show to list' do

    list = List.create!

    breaking = Show.create!(name: 'Breaking Bad', artwork: 'http://thetvdb.com/banners/_cache/posters/81189-10.jpg', description: "Mild-mannered high school chemistry teacher Walter")

    season = Season.create!(number: "1")
    breaking.seasons << season

    1.upto(5) do |i|
       breaking.seasons.find(season.id).episodes << Episode.create!(number: i, length: 42)
    end


    visit '/shows'

    click_on 'Add'

    expect(page).to have_content 'You have'
  end
end
