 require 'sinatra/base'
 require 'sinatra/reloader'
 require 'twitter'
 require 'date'
 require 'dotenv'
 Dotenv.load

 class Admin < Sinatra::Base
     configure :development do
         register Sinatra::Reloader
     end

    before do
        @client = Twitter::REST::Client.new do |config|
            config.consumer_key = ENV['CONSUMER_KEY']
            config.consumer_secret = ENV['CONSUMER_SERCRET']
            config.access_token = ENV['ACCESS_TOKEN']
            config.access_token_secret = ENV['ACCESS_TOKEN_SECRET']
        end
    end

     get '/server/health' do
         @client.update("Server health: OK(#{DateTime.now.to_s})")
         "ok"
     end
 end
