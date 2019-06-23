require 'rails_helper'

RSpec.describe Discover do
  describe '.belongs_to_me?' do
    context 'cards starting with 6011 and are 16 digits long' do
      let(:card_number) { '6011046969589479' }

      it 'returns true' do
        expect(described_class.belongs_to_me?(card_number)).to be true
      end
    end

    context 'cards not starting with 6011' do
      let(:card_number) { '5273519825814617' }

      it 'returns false' do
        expect(described_class.belongs_to_me?(card_number)).to be false
      end
    end

    context 'cards that are not 16 digits long' do
      let(:card_number) { '601151982581461458' }

      it 'returns false' do
        expect(described_class.belongs_to_me?(card_number)).to be false
      end
    end
  end
end
