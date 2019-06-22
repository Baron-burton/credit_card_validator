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
              expect(described_class.run(card_number))
                .to contain_exactly(true, 'Mastercard')
            end
          end
        end
      end
    end

    context 'Visa' do
      context 'valid credit card number' do
        let(:card_number) { '4716116250512291' }

        it 'validates the card number matches the Visa pattern' do
          expect(described_class.run(card_number))
            .to contain_exactly(true, 'Visa')
        end
      end
    end

    context 'Discover' do
      context 'valid credit card number' do
        let(:card_number) { '6011046969589479' }

        it 'validates the card number matches the Discover pattern' do
          expect(described_class.run(card_number))
            .to contain_exactly(true, 'Discover')
        end
      end
    end

    context 'Amex' do
      context 'valid credit card number' do
        let(:card_numbers) { %w[377381848857701 346949913087574] }

        it 'validates the card number matches the Discover pattern' do
          aggregate_failures do
            card_numbers.each do |card_number|
              expect(described_class.run(card_number))
                .to contain_exactly(true, 'Amex')
            end
          end
        end
      end
    end

    context 'invalid credit card number' do
      context 'it does not match any company pattern' do
        let(:card_number) { '1500000000000004' }

        it 'returns an error' do
          expect { described_class.run(card_number) }
            .to raise_error('Unknown card number')
        end
      end

      context 'it matches a company pattern but does not pass the Luhn check' do
        let(:card_number) { '6011046969589489' }

        it 'returns false with the company the card seems to belong to' do
          expect(described_class.run(card_number))
            .to contain_exactly(false, 'Discover')
        end
      end
    end
  end
end
