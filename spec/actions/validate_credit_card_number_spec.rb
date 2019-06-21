require 'rails_helper'

RSpec.describe ValidateCreditCardNumber do
  describe '.run' do
    context 'MasterCard' do
      context 'valid credit card number' do
        let(:card_number) { '5500000000000004' }

        it 'validates the card number matches the Mastercard pattern' do
          expect(described_class.run(card_number)).to be_truthy
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
end
