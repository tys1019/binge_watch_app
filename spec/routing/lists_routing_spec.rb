require 'rails_helper'

RSpec. describe 'routes for lists' do
  it 'routes GET /lists/:id to lists#show' do
    expect(get('/lists/1')).to route_to(
      controller: 'lists',
      action: 'show',
      id: '1'
      )
  end

end
