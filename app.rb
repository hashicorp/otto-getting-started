require 'sinatra'

enable :sessions

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
