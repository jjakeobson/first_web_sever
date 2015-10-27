require "sinatra"

get '/' do
  File.read(File.join('public', 'stock_ticker.rb'))
end

get '/this' do
  "Hello World "
end

get '/sinatra' do
  "Hello Sinatra"
end
