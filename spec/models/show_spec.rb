require 'rails_helper'

RSpec.describe Show do
  describe '.create' do
    it 'creates a new Show' do
      expect(Show.create()).to be_a Show
    end
  end
end
