require 'sinatra/base'
require 'twitter'
require 'dotenv'

Dotenv.load

class AutoRetweet < Sinatra::Base
    before do
        @client = Twitter::REST::Client.new do |config|
            config.consumer_key = ENV["CONSUMER_KEY"]
            config.consumer_secret = ENV["CONSUMER_SECRET"]
            config.access_token = ENV["ACCESS_TOKEN"]
            config.access_token_secret = ENV["ACCESS_TOKEN_SECRET"]
        end
    end

    post '/ps4live' do
        data = JSON.parse request.body.read

        if data['key'] != ENV['API_KEY']
            halt 403
        end

        begin
            tweet = @client.status(data['url']);
            if tweet.text.include? "#PS4live"
                @client.retweet(tweet)
            end
        rescue => e
            STDERR.puts e
            halt 500
        end

        status 200
    end
end
