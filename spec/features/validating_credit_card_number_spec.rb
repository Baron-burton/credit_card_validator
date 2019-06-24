# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Validating a credit card number' do
  context 'Number matches a company pattern' do
    scenario 'the number passes the Luhn check' do
      visit '/'

      fill_in 'card_number', with: '5485102976195757'
      click_button 'Validate!'

      expect(page).to have_text('Number belongs to Mastercard')
    end

    scenario 'the number does not pass the Luhn check' do
      visit '/'

      fill_in 'card_number', with: '5485102976195758'
      click_button 'Validate!'

      expect(page).to have_text('Invalid card number for Mastercard')
    end
  end

  context 'Number does not match any company pattern' do
    scenario 'the form returns an error' do
      visit '/'

      fill_in 'card_number', with: '11485102976195758'
      click_button 'Validate!'

      expect(page).to have_text('Unknown card number')
    end
  end

  context 'Input is not a number' do
    scenario 'the form returns an error' do
      visit '/'

      fill_in 'card_number', with: 'Some text'
      click_button 'Validate!'

      expect(page).to have_text('Try inputting a number instead')
    end
  end
end
