class Visa
  class << self
    def initial_digits
      '4'
    end

    def card_length
      [13, 16]
    end
  end
end
