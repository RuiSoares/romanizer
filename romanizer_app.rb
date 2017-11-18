require 'romanizer'
require 'sinatra'

helpers do
  def romanizer
    @romanizer ||= Romanizer.new
  end
end

get '/' do
  halt 200, 'Welcome to the Romanizer API, please provide a number between 0 and 10000 in the url'
end

get '/:number' do |number|
  begin
    halt 200, romanizer.parse(number)
  rescue => error
    halt 400, error.message
  end
end
