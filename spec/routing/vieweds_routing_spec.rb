require 'rails_helper'

RSpec.describe 'routes for vieweds' do
  it 'routes POST /vieweds/1 to vieweds#toggle_viewed' do
    expect(post('/vieweds/1')).to route_to(
      controller: 'vieweds',
      action: 'toggle_viewed',
      id: '1'
      )
  end

end
