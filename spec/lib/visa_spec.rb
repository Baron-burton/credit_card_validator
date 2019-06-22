require 'rails_helper'

RSpec.describe Visa do
  describe '.belongs_to_me?' do
    context 'cards starting with 4 and are 13 or 16 digits long' do
      let(:card_numbers) { %w[4929680533185 4716116250512291] }

      it 'returns true' do
        aggregate_failures do
          card_numbers.each do |card_number|
            expect(described_class.belongs_to_me?(card_number)).to be true
          end
        end
      end
    end

    context 'cards not starting with 4' do
      let(:card_number) { '5273519825814617' }

      it 'returns false' do
        expect(described_class.belongs_to_me?(card_number)).to be false
      end
    end

    context 'cards that are not 13 or 16 digits long' do
      let(:card_number) { '427351982581461458' }

      it 'returns false' do
        expect(described_class.belongs_to_me?(card_number)).to be false
      end
    end
  end
end
