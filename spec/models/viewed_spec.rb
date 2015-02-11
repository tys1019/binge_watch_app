require 'rails_helper'

RSpec.describe Viewed do
  describe '.create' do
    it 'creates a new Viewed status' do
      expect(Viewed.create()).to be_a Viewed
    end
  end
end
