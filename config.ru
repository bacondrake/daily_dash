Encoding::default_external = Encoding::UTF_8 if defined? Encoding

require 'dashing'
require 'dotenv'
Dotenv.load

configure do
  set :auth_token, ENV['YOUR_AUTH_TOKEN']

  helpers do
    def protected!
     # Put any authentication code you want in here.
     # This method is run before accessing any resource.
    end
  end
end

map Sinatra::Application.assets_prefix do
  run Sinatra::Application.sprockets
end

run Sinatra::Application