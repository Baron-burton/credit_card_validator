require 'rails_helper'

RSpec.describe Amex do
  describe '.belongs_to_me?' do
    context 'cards starting with 34 or 37 and are 15 digits long' do
      let(:card_numbers) { %w[377381848857701 346949913087574] }

      it 'returns true' do
        aggregate_failures do
          card_numbers.each do |card_number|
            expect(described_class.belongs_to_me?(card_number)).to be true
          end
        end
      end
    end

    context 'cards not starting with 34 or 37' do
      let(:card_number) { '4273519825814617' }

      it 'returns false' do
        expect(described_class.belongs_to_me?(card_number)).to be false
      end
    end

    context 'cards that are not 15 digits long' do
      let(:card_number) { '347351982581461458' }

      it 'returns false' do
        expect(described_class.belongs_to_me?(card_number)).to be false
      end
    end
  end
end
