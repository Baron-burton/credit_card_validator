class ValidateCreditCardNumber
  class << self
    def run(card_number)
      matches_card_company_pattern?(card_number) &&
        passes_luhn_algorithm?(card_number)
    end

    private

    def matches_card_company_pattern?(card_number)
      if Mastercard.initial_digits.include?(card_number[0..1])
        Mastercard.card_length == card_number.length
      elsif card_number.start_with?(Visa.initial_digits)
        Visa.card_length.include?(card_number.length)
      elsif card_number.start_with?(Discover.initial_digits)
        Discover.card_length == card_number.length
      elsif Amex.initial_digits.include?(card_number[0..1])
        Amex.card_length == card_number.length
      else
        raise 'Not a valid card number'
      end
    end

    def passes_luhn_algorithm?(card_number)
      number = card_number.chars.reverse.map(&:to_i)

      sum = number.each_slice(2).map do |x, y|
        y = 0 if y.nil?
        [x, (y * 2).divmod(10)]
      end.flatten.inject(&:+)

      (sum % 10).zero?
    end
  end
end
