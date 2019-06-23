class Discover
  class << self
    def belongs_to_me?(card_number)
      card_number.starts_with?(initial_digits) &&
        card_number.length == card_length
    end

    private

    def initial_digits
      '6011'
    end

    def card_length
      16
    end
  end
end
