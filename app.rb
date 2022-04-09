require 'sinatra/base'
require 'sinatra/reloader'
require './lib/cheet'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'Chitter'
  end

  get '/cheets' do
    @cheets = Cheet.all
    erb :'cheets/index'
  end

  get '/cheets/new' do
    erb :'cheets/new'
  end

  post '/cheets' do
    Cheet.create(cheet: params[:cheet])
    redirect '/cheets'
    
    #p params
    #p "Form data submitted to the /cheets route!"
  end

  run! if app_file == $0
end