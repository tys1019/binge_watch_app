require 'rails_helper'

RSpec.describe SeasonsController do
  describe 'PATCH update' do


    it 'updates the requested season' do
      @request.env['HTTP_REFERER'] = 'localhost:3000/shows'

      season = Season.create!
      patch :update, id: season
      season.reload
      expect(season.watched).to eq true
    end

    it 'marks all episodes as watched in a watched season' do
      @request.env['HTTP_REFERER'] = 'localhost:3000/shows'
      season = Season.create!
      episode = Episode.create!
      season.episodes << episode
      patch :update, id: season
      episode.reload
      expect(episode.watched?).to eq true
    end

    it 'marks all episodes as unwatched in an unwatched season' do
      @request.env['HTTP_REFERER'] = 'localhost:3000/shows'

      season = Season.create!(watched: true)
      episode = Episode.create!(watched: true)
      season.episodes << episode
      patch :update, id: season
      episode.reload
      expect(episode.watched?).to eq false
    end

    it 'assigns @season' do
      @request.env['HTTP_REFERER'] = 'localhost:3000/shows'

      season = Season.create!
      episode = Episode.create!
      season.episodes << episode
      patch :update, id: season
      expect(assigns(:season)).to eq season
    end
  end

end
