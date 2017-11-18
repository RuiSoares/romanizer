require 'errors'
require 'pry'

class Romanizer
  ROMAN_NUMBERS = {
    '_X' => 10000,
    'M_X' => 9000,
    '_V' => 5000,
    'M_V' => 4000,
    'M' => 1000,
    'CM' => 900,
    'D' => 500,
    'CD' => 400,
    'C' => 100,
    'XC' => 90,
    'L' => 50,
    'XL' => 40,
    'X' => 10,
    'IX' => 9,
    'V' => 5,
    'IV' => 4,
    'I' => 1
  }

  def parse(arg)
    number = Integer(arg) rescue false
    raise RomanizerErrors::NotANumberError.new unless number_is_integer?(number)
    raise RomanizerErrors::OutOfRangeError.new unless number_in_range?(number)

    romanize(number)
  end

  private

  def romanize(number)
    return 'nulla' if number == 0

    roman_result = ''

    ROMAN_NUMBERS.each do |roman, value|
      while number >= value
        roman_result << roman
        number -= value
      end
    end

    roman_result
  end

  def number_in_range?(number)
    number <= 10000 && number >= 0
  end

  def number_is_integer?(number)
    number.is_a? Integer
  end
end
