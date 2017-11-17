require 'romanizer'
require 'sinatra'

helpers do
  def romanizer
    @romanizer ||= Romanizer.new
  end
end

get '/:number' do |number|
  begin
    romanizer.parse(number)
  rescue => error
    error.message
  end
end
