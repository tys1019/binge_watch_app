require 'rails_helper'

RSpec.describe 'routes for episodes' do
  it 'routes PATCH /seasons/1 to seasons#update' do
    expect(patch('/seasons/1')).to route_to(
      controller: 'seasons',
      action: 'update',
      id: '1'
      )
  end

end
