#require 'bundler'
#Bundler.require
require 'gossip'

class ApplicationController < Sinatra::Base
  #get '/' do
    #{}"Hello World"
  #end

  get '/' do
  erb :index, locals: {gossips: Gossip.all}
end

  get '/gossips/new/' do
    erb :new_gossip
  end

post '/gossips/new/' do
  Gossip.new(params["gossip_author"],params["gossip_content"]).save
  redirect '/'
end

#get '/hello/:name' do
  # matches "GET /hello/foo" and "GET /hello/bar"
  # params['name'] is 'foo' or 'bar'
  #"Hello #{params['name']}!"
#end

get '/gossips/:id/' do
  erb :show, locals: {gossips: Gossip.find(params[:id])}
end
end

  #run! if app_file == $0
#end
