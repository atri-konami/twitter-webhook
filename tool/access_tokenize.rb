require 'oauth'
require 'dotenv'
Dotenv.load

client = OAuth::Consumer.new(
    ENV['CONSUMER_KEY'],
    ENV['CONSUMER_SECRET'],
    site: 'https://api.twitter.com',
    authorize_path: '/oauth/authenticate'
)

request_token = client.get_request_token(oauth_callback:'oob')
puts "1. please access to: #{request_token.authorize_url} and authorize it"
print "2. input PIN code: "
pin = gets.chomp

access_token = request_token.get_access_token(oauth_verifier:pin)

puts "access_token: #{access_token.token}", "access_token_secret: #{access_token.secret}"
