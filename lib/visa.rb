class Visa
  class << self
    def belongs_to_me?(card_number)
      card_number.starts_with?(initial_digits) &&
        card_length.include?(card_number.length)
    end

    private

    def initial_digits
      '4'
    end

    def card_length
      [13, 16]
    end
  end
end
