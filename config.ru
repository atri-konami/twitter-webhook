require './src/main'
require './src/admin'
require './middleware/apikey-checker'

map '/' do 
    run Main
end

map '/admin' do
    use APIKeyChecker
    run Admin
end
