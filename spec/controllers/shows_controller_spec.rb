require 'rails_helper'
require 'byebug'

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

  describe 'GET index' do
    it 'has a 200 status code' do
      get :index
      expect(response.status).to eq 200
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end

    it 'assigns @shows' do
      shows = Show.all
      get :index
      expect(assigns(:shows)).to eq shows
    end
  end


  describe 'POST update' do
    it 'adds a show to a list' do
      @request.env['HTTP_REFERER'] = 'localhost:3000/shows'

      show = Show.create!
      episode = show.episodes.create!
      list = List.create!

      patch :update, id: show, show: { list_id: list.id }
      show.reload
      expect(show.lists.first).to eq list

    end

    it 'adds episodes to a list' do
      @request.env['HTTP_REFERER'] = 'localhost:3000/shows'

      show = Show.create!
      episode = show.episodes.create!
      list = List.create!
      expect {
          patch :update, id: show, show: { list_id: list.id }
          }.to change(Viewed, :count).by 1

    end


    it 'removes a show from a list' do
      @request.env['HTTP_REFERER'] = 'localhost:3000/shows'

      show = Show.create!
      episode = show.episodes.create!
      list = List.create!
      show.lists << list
      show.save

      patch :update, id: show, show: { list_id: list.id }
      show.reload
      expect(show.lists).to eq []
    end

    it 'adds episodes to a list' do
      @request.env['HTTP_REFERER'] = 'localhost:3000/shows'

      show = Show.create!
      episode = show.episodes.create!
      list = List.create!
      list.shows << show
      v = list.vieweds.create!
      v.show = show
      v.episode = episode
      v.save
      expect {
          patch :update, id: show, show: { list_id: list.id }
          }.to change(Viewed, :count).by -1


    end

    it 'assigns @show' do
      @request.env['HTTP_REFERER'] = 'localhost:3000/shows'
      list = List.create!
      show = Show.create!
      patch :update, id: show, show: { list_id: list.id }
      expect(assigns(:show)).to eq show
    end
  end

end
