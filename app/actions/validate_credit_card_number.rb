class ValidateCreditCardNumber
  class << self
    CARD_COMPANIES = [Mastercard, Visa, Amex, Discover].freeze

    def run(card_number)
      raise 'Try inputting a number instead' if card_number.to_i.zero?

      card_company = matching_card_company(card_number)

      [passes_luhn_algorithm?(card_number), card_company]
    end

    private

    def matching_card_company(card_number)
      CARD_COMPANIES.each do |company|
        return company.to_s if company.belongs_to_me?(card_number)
      end

      raise 'Unknown card number'
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
