require 'rails_helper'

RSpec.describe ShowsController do
  describe 'GET /' do
    it 'has a 200 status code' do
      get :welcome
      expect(response.status).to eq 200
    end

    it 'renders the welcome template' do
      get :welcome
      expect(response).to render_template('welcome')
    end
  end

end
