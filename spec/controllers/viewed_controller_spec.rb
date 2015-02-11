require 'rails_helper'

RSpec.describe ViewedsController do
  describe 'POST toggle_viewed' do

    it 'toggles the requested episode' do
      @request.env['HTTP_REFERER'] = 'localhost:3000/shows'
      episode = Episode.create!
      list = List.create!
      v = Viewed.create!
      v.episode = episode
      v.list = list
      patch :toggle_viewed, id: v
      v.reload
      expect(v.viewed).to eq true
    end

    # it 'marks all episodes as watched in a watched season' do
    #   @request.env['HTTP_REFERER'] = 'localhost:3000/shows'
    #   season = Season.create!
    #   episode = Episode.create!
    #   season.episodes << episode
    #   patch :update, id: season
    #   episode.reload
    #   expect(episode.watched?).to eq true
    # end

    # it 'marks all episodes as unwatched in an unwatched season' do
    #   @request.env['HTTP_REFERER'] = 'localhost:3000/shows'

    #   season = Season.create!(watched: true)
    #   episode = Episode.create!(watched: true)
    #   season.episodes << episode
    #   patch :update, id: season
    #   episode.reload
    #   expect(episode.watched?).to eq false
    # end

    it 'assigns @viewed' do
      @request.env['HTTP_REFERER'] = 'localhost:3000/shows'
      episode = Episode.create!
      list = List.create!
      v = Viewed.create!
      v.episode = episode
      v.list = list
      patch :toggle_viewed, id: v
      v.reload
      expect(assigns(:viewed)).to eq v
    end
  end

end
