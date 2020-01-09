require('sinatra')
require('sinatra/reloader')
require('./lib/train')
require('pry')
also_reload('lib/**/*.rb')
require('./lib/city')
require('pg')

DB = PG.connect ({:dbname => 'train_system'})

get('/') do
  redirect to('/purchase_ticket')
end

get('/purchase_ticket') do
  erb(:purchase_ticket)
end

# CRUD for Train

get('/trains') do
  @trains = Train.all
  erb(:trains)
end

get('/trains/new') do
  erb(:new_train)
end

get('/trains/:id/update') do
  @train = Train.find_by_id(params[:id].to_i)
  erb(:update_train)
end

post('/trains') do
  name = params[:train_name] #come back for many to many relationship
  train = Train.new(:name => name, :id => nil)
  train.save
  redirect to('/trains')
end

get('/trains/:id') do
  @train = Train.find_by_id(params[:id].to_i)
  erb(:train)
end

patch('/trains/:id') do
  @train = Train.find_by_id(params[:id].to_i)
  @train.update_name(params[:name])
  redirect to("/trains/#{params[:id]}")
end

delete('/trains/:id') do
  @train = Train.find_by_id(params[:id].to_i)
  @train.delete
  redirect to('/trains')
end

# CRUD for City

get('/cities') do
  @cities = City.all
  erb(:cities)
end

get('/cities/new') do
  erb(:new_city)
end

get('/cities/:id/update') do
  @city = City.find_by_id(params[:id].to_i)
  erb(:update_city)
end

post('/cities') do
  name = params[:city_name] #come back for many to many relationship
  city = City.new(:name => name, :id => nil)
  city.save
  redirect to('/cities')
end

get('/cities/:id') do
  @city = City.find_by_id(params[:id].to_i)
  erb(:city)
end

patch('/cities/:id') do
  @city = City.find_by_id(params[:id].to_i)
  @city.update_name(params[:name])
  redirect to("/cities/#{params[:id]}")
end

delete('/cities/:id') do
  @city = City.find_by_id(params[:id].to_i)
  @city.delete
  redirect to('/cities')
end
