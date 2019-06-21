require 'rails_helper'

RSpec.describe Amex do
  describe '.initial_digits' do
    it 'equals an array including 34 and 37' do
      expect(Amex.initial_digits).to eq(%w[34 37])
    end
  end

  describe '.card_length' do
    it 'equals 15' do
      expect(Amex.card_length).to eq(15)
    end
  end
end
