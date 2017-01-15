require 'sinatra'
require 'sinatra/reloader'
require_relative 'lib/caesar'

get "/" do
  erb :index
end
