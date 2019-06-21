class ValidateCreditCardNumber
  class << self
    def run(card_number)
      matches_card_company_pattern?(card_number)
    end

    private

    def matches_card_company_pattern?(card_number)
      initial_digits = card_number[0..3]

      if Mastercard.initial_digits.include?(initial_digits[0..1])
        Mastercard.card_length == card_number.length
      elsif card_number.start_with?(Visa.initial_digits)
        Visa.card_length.include?(card_number.length)
      else
        raise 'Not a valid card number'
      end
    end
  end
end
