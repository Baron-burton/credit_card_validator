require 'rails_helper'

RSpec.describe 'Find Card Company for Card Number' do
  let(:params) do
    HashWithIndifferentAccess.new(card_number: card_number)
  end

  context 'when receiving a valid card number' do
    let(:card_number) { '5485102976195757' }

    it 'returns a 200 response with the name of the card company' do
      get '/api/v1/find_card_company', params: params

      expect(response.body)
        .to include('Number belongs to Mastercard')
    end
  end

  context 'when receiving a number that does not pass the Luhn check' do
    let(:card_number) { '5495102976195757' }

    it 'returns a 404 response with an error' do
      get '/api/v1/find_card_company', params: params

      expect(response.body)
        .to include('Invalid card number for Mastercard')
    end
  end

  context 'when receiving a number that does not match a company pattern' do
    let(:card_number) { '1273519825814617' }

    it 'returns an error' do
      get '/api/v1/find_card_company', params: params

      expect(response.body)
        .to include('Unknown card number')
    end
  end

  context 'when receiving something other than a number' do
    let(:card_number) { 'Not-a-number' }

    it 'returns an error' do
      get '/api/v1/find_card_company', params: params

      expect(response.body)
        .to include('Try inputting a number instead')
    end
  end
end
