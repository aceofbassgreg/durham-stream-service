require 'rubygems'
require 'bundler'
require 'sinatra'
require 'sinatra/activerecord'
require './config/environments'
require './app/models/entry'

Bundler.require

module RTPEventService
  class App < Sinatra::Application
    
    register Sinatra::ActiveRecordExtension
    # configure do
    #   disable :method_override
    #   disable :static

    #   set :sessions,
    #       :httponly     => true,
    #       :secure       => production?,
    #       :expire_after => 31557600, # 1 year
    #       :secret       => ENV['SESSION_SECRET']
    # end

    # use Rack::Deflater

  end
end