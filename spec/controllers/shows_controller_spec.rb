require 'rails_helper'

RSpec.describe ShowsController do
  describe 'GET welcome' do
    it 'has a 200 status code' do
      get :welcome
      expect(response.status).to eq 200
    end

    it 'renders the welcome template' do
      get :welcome
      expect(response).to render_template('welcome')
    end

    it 'assigns @shows' do
      shows = Show.all
      get :welcome
      expect(assigns(:shows)).to eq shows
    end
  end

  # describe 'GET index' do
  #   it 'has a 200 status code' do
  #     get :index
  #     expect(response.status).to eq 200
  #   end

  #   it 'renders the index template' do
  #     get :index
  #     expect(response).to render_template('index')
  #   end

  #   it 'assigns @shows' do
  #     shows = Show.all
  #     get :index
  #     expect(assigns(:shows)).to eq shows
  #   end
  # end

end
