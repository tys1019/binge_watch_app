require 'rails_helper'
require 'byebug'

RSpec.describe Show do
  let(:test_show) do
    breaking = Show.create!(name: 'Breaking Bad', artwork: 'http://thetvdb.com/banners/_cache/posters/81189-10.jpg', description: "Mild-.")

    season = Season.create(number: 1)
    episode = Episode.create!(number: 1, length: 180, watched: true)
    breaking.seasons << season
    season.episodes << episode
    breaking.episodes << episode
    breaking
  end

  describe '.create' do
    it 'creates a new Show' do
      expect(Show.create()).to be_a Show
    end
  end

  describe '.runtime' do
    it 'calculates the total length of show' do
      breaking = Show.create!(name: 'Breaking Bad', artwork: 'http://thetvdb.com/banners/_cache/posters/81189-10.jpg', description: "Mild-.")

      season = Season.create(number: 1)
      episode = Episode.create!(number: 1, length: 42)
      breaking.seasons << season
      season.episodes << episode
      breaking.episodes << episode


      expect(breaking.runtime).to eq 1
    end
  end

  describe '.time_watched' do
    it 'calculates the total watched of show' do
      expect(test_show.time_watched).to eq 3
    end
  end

  describe '.time_left' do
    it 'calculates the total watched of show' do
      expect(test_show.time_left).to eq 0
    end
  end

end
