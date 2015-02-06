require 'rails_helper'

RSpec.describe List do
  describe '.create' do
    it 'creates a new List' do
      expect(List.create()).to be_a List
    end
  end
end
