class Amex
  class << self
    def belongs_to_me?(card_number)
      initial_digits.include?(card_number[0..1]) &&
        card_number.length == card_length
    end

    private

    def initial_digits
      %w[34 37]
    end

    def card_length
      15
    end
  end
end
