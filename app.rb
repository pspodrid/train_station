require('sinatra')
require('sinatra/reloader')
require('./lib/train')
require('pry')
also_reload('lib/**/*.rb')
require('./lib/city')
require('pg')

DB = PG.connect ({:dbname => 'train_system'})

get('/') do
  redirect to('/trains')
end

get('/trains') do
  redirect to('/trains')
end

get('/trains/save') do
  erb(:save_train)
end

get('/trains/update') do
  @train = Train.find(params[:id].to_i())
  erb(:update_train)
end
