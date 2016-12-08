require 'sinatra/base'
require 'twitter'
require 'dotenv'
Dotenv.load

class TwitterOAuth < Sinatra::Base
    before do
        @client = Twitter::REST::Client.new do |config|
            config.consumer_key = ENV['CONSUMER_KEY']
            config.consumer_secret = ENV['CONSUMER_SERCRET']
            config.access_token = ENV['ACCESS_TOKEN']
            config.access_token_secret = ENV['ACCESS_SECRET']
        end
    end
end
