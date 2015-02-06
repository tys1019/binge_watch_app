require 'rails_helper'

RSpec.describe ListsController do
  describe 'GET show' do
    it 'has a 200 status code' do
      list = List.create!
      get :show, id: list
      expect(response.status).to eq 200
    end

    it 'renders the show template' do
      list = List.create!
      get :show, id: list
      expect(response).to render_template('show')
    end

    it 'assigns @list' do
      list = List.create!
      get :show, id: list
      expect(assigns(:list)).to eq list
    end
  end

end
