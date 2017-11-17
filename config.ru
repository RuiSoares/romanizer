$LOAD_PATH.unshift("#{File.dirname(__FILE__)}/lib")
require('./romanizer_app')

run Sinatra::Application
