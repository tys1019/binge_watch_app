require 'rails_helper'

RSpec.feature 'Managing shows' do
  scenario 'Visit the welcome page' do
    visit '/'

    expect(page).to have_selector 'section', count: 3
  end

  scenario 'Visit the index page' do
    visit '/shows'

    expect(page).to have_selector 'section', count: 3
  end
end
