require 'rubygems'
require 'bundler'
require 'sinatra'
require 'sinatra/activerecord'
require './config/environments'
require './app/models/entry'

Bundler.require

class InvalidEntry < StandardError; end

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


    # @entry.save || raise InvalidEntry
    post '/submit' do
      @entry = Entry.new(params[:entry])
      @entry.save || (raise InvalidEntry)
    rescue InvalidEntry
      puts "Entry was not formatted properly!"
      status 422
    end

  end
end