require 'rails_helper'

RSpec.describe 'routes for statuses' do
  it 'routes POST /shows/:id to statuses#create' do
    expect(post('/shows/1')).to route_to(
      controller: 'statuses',
      action: 'create',
      show_id: '1'
    )
  end
end
