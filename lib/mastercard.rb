class Mastercard
  class << self
    def initial_digits
      %w[51 52 53 54 55]
    end

    def card_length
      16
    end
  end
end
