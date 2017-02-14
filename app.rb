require 'sinatra'
require 'sinatra/reloader'
require 'active_record'

require_relative 'db/connection.rb'

require_relative 'models/pokemon.rb'
require_relative 'models/trainer.rb'

get '/pokemon' do
  @pokemon = Pokemon.all
  erb :"pokemons/index", :layout => :"layout_pokemon"
end

get '/pokemon/new' do
  erb :"pokemons/new", :layout => :"layout_pokemon"
end

get '/pokemon/:id' do
  @pokemon = Pokemon.find(params[:id])
  erb :"pokemons/show", :layout => :"layout_pokemon"
end

put '/pokemon/:id' do
  @pokemon = Pokemon.find(params[:id])
  @pokemon.update(params[:pokemon])
  redirect("/pokemon/#{@pokemon.id}")
end

delete '/pokemon/:id' do
  @pokemon = Pokemon.find(params[:id])
  @pokemon.destroy
  redirect("/pokemon")
end

get '/pokemon/:id/edit' do
  @pokemon = Pokemon.find(params[:id])
  erb :"pokemons/edit", :layout => :"layout_pokemon"
end

post '/pokemon' do
  params[:pokemon][:img_url] = "https://img.pokemondb.net/artwork/#{params[:pokemon][:name].downcase}.jpg"
  params[:pokemon][:cp] = rand(800)
  @pokemon = Pokemon.create(params[:pokemon])
  redirect "/pokemon/#{@pokemon.id}"
end




get '/trainer' do
  @trainer = Trainer.all
  erb :"trainers/index"
end

get '/trainer/new' do
  erb :"trainers/new"
end

get '/trainer/:id' do
  @trainer = Trainer.find(params[:id])
  erb :"trainers/show"
end

put '/trainer/:id' do
  @trainer = Trainer.find(params[:id])
  @trainer.update(params[:trainer])
  redirect("/trainer/#{@trainer.id}")
end

delete '/trainer/:id' do
  @trainer = Trainer.find(params[:id])
  @trainer.destroy
  redirect("/trainer")
end

get '/trainer/:id/edit' do
  @trainer = Trainer.find(params[:id])
  erb :"trainers/edit"
end

post '/trainer' do
  params[:trainer][:level] = 1
  @trainer = Trainer.create(params[:trainer])
  redirect "/trainer/#{@trainer.id}"
end
