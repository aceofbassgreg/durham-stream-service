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

    post '/entries' do
      begin
        content_type :json
        params = JSON.parse(request.env["rack.input"].read)
        @entry = Entry.new(params)
        @entry.save! 
      rescue ActiveRecord::RecordInvalid => ex
        if ex.message == "Validation failed: Md5 has already been taken"
          puts "Duplicate entry! Skipping"
          return 201
        end
      rescue 
        puts "Entry was not formatted properly!"
        status 422
      end
    end

    get '/entries' do
      Entry.all.to_json
    end

  end
end