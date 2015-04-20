require 'rubygems'
require 'sinatra'
require 'haml'

get '/' do
	haml :index
end

get '/bootstrap' do
	haml :bs
end