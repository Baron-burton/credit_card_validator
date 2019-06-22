class Mastercard
  class << self
    def belongs_to_me?(card_number)
      initial_digits.include?(card_number[0..1]) &&
        card_number.length == card_length
    end

    private

    def initial_digits
      %w[51 52 53 54 55]
    end

    def card_length
      16
    end
  end
end
