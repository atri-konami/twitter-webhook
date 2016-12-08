require 'dotenv'
Dotenv.load

class APIKeyChecker
    def initialize(app)
        @app = app
    end

    def call(env)
        res = []
        if env['HTTP_X_API_KEY'] == ENV['API_KEY']
            res = @app.call env
        else
            res[0] = 401
            res[2] = ['Unauthorized.']
            content_length = res[2].inject(0){|a,b| a + b.size}.to_s
            res[1] = { 'Content-Type' => 'text/html', 'Content-Length' => content_length }
        end
        res
    end
end
