require 'rails_helper'

RSpec.feature 'Managing shows' do
  scenario 'Welcome page shows all the TV shows' do
    visit '/'

    expect(page).to have_selector 'section', count: Show.count
  end

  scenario 'Show all TV shows' do
    visit '/shows'

    expect(page).to have_selector 'section', count: Show.count
  end
end
