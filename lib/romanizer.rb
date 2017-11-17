require 'errors'
require 'pry'

class Romanizer

  def parse(arg)
    number = Integer(arg) rescue false
    raise RomanizerErrors::NotANumberError.new unless number.is_a? Integer
    raise RomanizerErrors::OutOfRangeError.new unless number <= 10000 && number >= 0

    return number
  end
end
