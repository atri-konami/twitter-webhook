 require 'sinatra/base'
 require 'sinatra/reloader'

 class Main < Sinatra::Base
     configure :development do
         register Sinatra::Reloader
     end

     get '/' do
         "荒らしｷﾀ━(ﾟ∀ﾟ)━( ﾟ∀)━( 　ﾟ)━(　　)━(　　)━(・ 　)━(∀・ )━(・∀・)━ｶｴﾚ!!!!"
     end
 end
