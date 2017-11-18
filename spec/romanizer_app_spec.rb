require 'spec_helper'
require 'rack/test'
require './romanizer_app'
require 'errors'

describe 'RomanizerApp' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  describe '#GET' do
    context 'when no input' do
      it 'returns url is not present' do
        get '/'

        expect(last_response.status).to eq 200
        expect(last_response.body).to eq 'Welcome to the Romanizer API, please provide a number between 0 and 10000 in the url'
      end
    end

    context 'when invalid input' do
      it 'returns invalid input error' do
        get '/potato'

        expect(last_response.status).to eq 400
        expect(last_response.body).to eq RomanizerErrors::NotANumberError.new.message
      end
    end

    context 'when number is bigger than 10000' do
      it 'returns an error message' do
        get '/10001'

        expect(last_response.status).to eq 400
        expect(last_response.body).to eq RomanizerErrors::OutOfRangeError.new.message
      end
    end

    context 'when valid number' do
      it 'returns the roman number' do
        get '/9999'

        expect(last_response.status).to eq 200
        expect(last_response.body).to eq('M_XCMXCIX')
      end
    end
  end
end
