require 'rails_helper'

RSpec.describe 'routes for lists' do
  it 'routes POST /lists/ to lists#create' do
    expect(post('/lists/')).to route_to(
      controller: 'lists',
      action: 'create'
      )
  end

  it 'routes GET /lists/new to lists#new' do
    expect(get('/lists/new')).to route_to(
      controller: 'lists',
      action: 'new'
      )
  end

  it 'routes GET /lists/:id to lists#show' do
    expect(get('/lists/1')).to route_to(
      controller: 'lists',
      action: 'show',
      id: '1'
      )
  end

  it 'routes GET /lists/ to lists#index' do
    expect(get('/lists/')).to route_to(
      controller: 'lists',
      action: 'index'
      )
  end

end
