require 'rails_helper'

RSpec.feature 'Managing shows' do
  scenario 'Welcome page shows all the TV shows' do
    Show.create!(name: 'Breaking Bad', artwork: 'http://thetvdb.com/banners/_cache/posters/81189-10.jpg', description: "Mild-.")

    visit '/'

    expect(page).to have_selector 'section'
  end

  scenario 'Show all TV shows and episodes' do
    Show.create!(name: 'Breaking Bad', artwork: 'http://thetvdb.com/banners/_cache/posters/81189-10.jpg', description: "Mild-.")

    visit '/shows'

    expect(page).to have_selector 'section'
  end
end
