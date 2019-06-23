require 'rails_helper'

RSpec.describe Mastercard do
  describe '.belongs_to_me?' do
    context 'cards starting with 51..55 and are 16 digits long' do
      let(:card_numbers) do
        %w[
          5500000000000004
          5374610189499117
          5485102976195757
          5128513451419889
          5273519825814617
        ]
      end

      it 'returns true' do
        aggregate_failures do
          card_numbers.each do |card_number|
            expect(described_class.belongs_to_me?(card_number)).to be true
          end
        end
      end
    end

    context 'cards not starting with 51..55' do
      let(:card_number) { '4273519825814617' }

      it 'returns false' do
        expect(described_class.belongs_to_me?(card_number)).to be false
      end
    end

    context 'cards that are not 16 digits long' do
      let(:card_number) { '527351982581461458' }

      it 'returns false' do
        expect(described_class.belongs_to_me?(card_number)).to be false
      end
    end
  end
end
