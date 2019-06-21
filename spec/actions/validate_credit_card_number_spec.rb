require 'rails_helper'

RSpec.describe ValidateCreditCardNumber do
  describe '.run' do
    context 'MasterCard' do
      context 'valid credit card number' do
        let(:card_numbers) do
          %w[
            5500000000000004
            5374610189499117
            5485102976195757
            5128513451419889
            5273519825814617
          ]
        end

        it 'validates the card number matches the Mastercard pattern' do
          aggregate_failures do
            card_numbers.each do |card_number|
              expect(described_class.run(card_number)).to be_truthy
            end
          end
        end
      end
    end

    context 'Visa' do
      context 'valid credit card number' do
        let(:card_number) { '4111111111111111' }

        it 'validates the card number matches the Visa pattern' do
          expect(described_class.run(card_number)).to be_truthy
        end
      end
    end

    context 'Discover' do
      context 'valid credit card number' do
        let(:card_number) { '6011000000000004' }

        it 'validates the card number matches the Discover pattern' do
          expect(described_class.run(card_number)).to be_truthy
        end
      end
    end

    context 'Amex' do
      context 'valid credit card number' do
        let(:card_numbers) { %w[377381848857701 346949913087574] }

        it 'validates the card number matches the Discover pattern' do
          aggregate_failures do
            card_numbers.each do |card_number|
              expect(described_class.run(card_number)).to be_truthy
            end
          end
        end
      end
    end

    context 'invalid credit card number' do
      let(:card_number) { '1500000000000004' }

      it 'returns an error' do
        expect { described_class.run(card_number) }
          .to raise_error('Not a valid card number')
      end
    end
  end
end
