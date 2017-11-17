module RomanizerErrors
  class NotANumberError < StandardError
    def message
      "And caesar wept 'why did you not give me a number?'"
    end
  end

  class OutOfRangeError < StandardError
    def message
      "And caesar wept 'can you give me a number between 0 and 10000?'"
    end
  end
end
