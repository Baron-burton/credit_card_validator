require 'rails_helper'

RSpec.describe Visa do
  describe '.initial_digits' do
    it 'equals 4' do
      expect(Visa.initial_digits).to eq('4')
    end
  end

  describe '.card_length' do
    it 'can be 13 or 16' do
      expect(Visa.card_length).to eq([13, 16])
    end
  end
end
