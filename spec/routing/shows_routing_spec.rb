require 'rails_helper'

RSpec. describe 'routes for shows' do
  it 'routes GET / to shows#welcome' do
    expect(get('/')).to route_to('shows#welcome')
  end
end
