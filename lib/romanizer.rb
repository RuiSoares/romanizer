require 'pry'

class Romanizer

  def run(arg)
    number = Integer(arg) rescue false
    raise ArgumentError.new("And caesar wept 'why did you not give me a number?'") unless number.is_a? Integer

    return number
  end
end
