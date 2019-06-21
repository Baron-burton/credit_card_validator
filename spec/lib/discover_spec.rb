require 'rails_helper'

RSpec.describe Discover do
  describe '.initial_digits' do
    it 'equals 6011' do
      expect(Discover.initial_digits).to eq('6011')
    end
  end

  describe '.card_length' do
    it 'equals 16' do
      expect(Discover.card_length).to eq(16)
    end
  end
end
