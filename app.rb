require 'sinatra'

enable :sessions

set :session_secret, 'otto'

helpers do
    include Rack::Utils
    alias_method :h, :escape_html
end

get '/' do
  if session['name']
    @name = session['name']
    erb :name
  else
    erb :index
  end
end

post '/' do
  session['name'] = params['name']
  redirect to('/')
end

get '/reset' do
  session['name'] = nil
  redirect to('/')
end
