require './src/main'
require './src/admin'
require './src/auto_rt'
require './middleware/apikey-checker'

map '/' do 
    run Main
end

map '/admin' do
    use APIKeyChecker
    run Admin
end

map '/autort' do
    run AutoRetweet
end
