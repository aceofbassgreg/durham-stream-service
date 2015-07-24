require 'rubygems'
require 'bundler'
require 'sinatra'
require 'sinatra/activerecord'
require './config/environments'
require './app/models/entry'
require 'json'

Bundler.require

class InvalidEntry < StandardError; end

module DurhamStreamService
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
    post '/entries' do
      begin
        content_type :json
        params = JSON.parse(request.env["rack.input"].read)
        @entry = Entry.new(params)
        @entry.save || (raise InvalidEntry)
      rescue InvalidEntry
        puts "Entry was not formatted properly!"
        status 422
      end
    end

    get '/entries' do
      Entry.all.to_json
    end

  end
end