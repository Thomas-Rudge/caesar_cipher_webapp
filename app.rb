require 'sinatra'
#require 'sinatra/reloader'
require_relative 'lib/caesar'

get "/" do
  inputs = [params["text"], params["shift"].to_i]
  output = ""

  unless inputs[0].nil? || inputs[0].empty?
    output = cipher(*inputs)
  end

  erb :index, :locals=>{:cipher=>output}
end
