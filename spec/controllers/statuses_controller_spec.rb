require 'rails_helper'

RSpec.describe StatusesController do
  let(:list) {
    {}
  }

  let(:show) {
   { name: 'Breaking Bad', artwork: 'http://thetvdb.com/banners/_cache/posters/81189-10.jpg', description: "Mild-." }
  }






  describe 'POST create' do
    it 'creates new episode-list relationships' do
      expect {
        post :create, list: list, show: show
      }.to change(Status, :count).by 1
    end

    # it 'assigns @show' do
    #   post :create, show: @show
    #   expect(assigns(:show)).to be_a Show
    # end

    # it 'redirects to the created article' do
    #   post :create, show: @show
    #   expect(response).to redirect_to(shows_path)
    # end
  end
end





# excess code was being used to generate stuff, pretty sure I don't need it
    # show = Show.create!(name: 'Breaking Bad', artwork: 'http://thetvdb.com/banners/_cache/posters/81189-10.jpg', description: "Mild-.")

    # season = Season.create!(number: 1)
    # episode = Episode.create!(number: 1)

    # season.episodes << episode
    # show.seasons << season
