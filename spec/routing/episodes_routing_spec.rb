require 'rails_helper'

RSpec.describe 'routes for episodes' do
  it 'routes PATCH /episodes/1 to episodes#update' do
    expect(patch('/episodes/1')).to route_to(
      controller: 'episodes',
      action: 'update',
      id: '1'
      )
  end

end
