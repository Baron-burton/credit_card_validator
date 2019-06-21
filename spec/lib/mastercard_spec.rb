require 'rails_helper'

RSpec.describe Mastercard do
  describe '.initial_digits' do
    it 'equals an array including 51, 52, 53, 54, 55' do
      expect(Mastercard.initial_digits).to eq(%w[51 52 53 54 55])
    end
  end

  describe '.card_length' do
    it 'equals 16' do
      expect(Mastercard.card_length).to eq(16)
    end
  end
end
