require 'rails_helper'

RSpec.describe EpisodesController do
  describe 'PATCH update' do

    let(:new_attributes) {
        { watched?: true }
      }

    it 'updates the requested episode' do
      episode = Episode.create!
      patch :update, id: episode, episode: new_attributes
      episode.reload
      expect(episode.watched?).to eq new_attributes[:watched?]
    end

    it 'assigns @episode' do
      episode = Episode.create!
      patch :update, id: episode, episode: new_attributes
      expect(assigns(:episode)).to eq episode
    end
  end

end
