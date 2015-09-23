require 'sinatra'

enable :sessions

set :bind, '0.0.0.0'
set :port, 9292
set :session_secret, 'otto'

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
