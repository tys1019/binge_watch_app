require 'rails_helper'

RSpec.feature 'Managing list' do
  scenario 'Add show to list' do
    visit '/lists/1'

    click_on 'Add'

    expect(page).to have_content '3.5'
  end
end
