require 'rails_helper'

RSpec.feature 'Managing shows' do
  scenario 'Welcome page shows all the TV shows' do
    visit '/'

    expect(page).to have_selector 'section', count: 3
  end

  scenario 'Show all TV shows and episodes' do
    visit '/shows'

    expect(page).to have_selector 'section'
  end
end
