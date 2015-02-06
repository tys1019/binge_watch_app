require 'rails_helper'

RSpec.feature 'Managing shows' do
  scenario 'Visit the welcome page' do
    visit '/'

    expect(page).to have_selector 'section'
  end
end
