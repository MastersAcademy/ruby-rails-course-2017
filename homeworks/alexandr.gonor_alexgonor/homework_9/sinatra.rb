require 'sinatra'

get '/:name/:surname' do
  "Hello, #{params[:name]} #{params[:surname]}\n
   Time now: #{Time.now.strftime('%H:%M')}"
end

get '/about' do
  'A little about me.'
end

get '/form' do
  erb :form
end

post '/form' do
  "You said '#{params[:message]}'"
end

not_found do
  halt 404, 'page not found'
end
