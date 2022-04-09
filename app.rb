require 'sinatra/base'
require 'sinatra/reloader'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'Chitter'
  end

  get '/cheets' do
    cheets = [
        "Loud Cheet 1",
        "Loud Cheet 2",
        "Loud Cheet 3"
    ]

    cheets.join

  end


  run! if app_file == $0
end