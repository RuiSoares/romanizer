module RomanizerErrors
  class NotANumberError < StandardError
    def message
      "Input must be an integer between 0 and 10000 (inclusive)"
    end
  end

  class OutOfRangeError < StandardError
    def message
      "The number must be between 0 and 10000 (inclusive)"
    end
  end
end
