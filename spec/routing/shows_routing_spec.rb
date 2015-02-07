require 'rails_helper'

RSpec.describe 'routes for shows' do
  it 'routes GET / to shows#welcome' do
    expect(get('/')).to route_to('shows#welcome')
  end

  it 'routes GET /shows to shows#index' do
    expect(get('/shows')).to route_to('shows#index')
  end
end
