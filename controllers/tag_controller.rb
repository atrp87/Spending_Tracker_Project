require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/tag')
also_reload('../models/*')

get '/tags' do
  @tags = Tag.all()
  erb(:index)
end

get '/tags/new' do
  erb(:"tag/new")
end

post '/tags' do
  @tag = Tag.new(params)
  @tag.save()
  redirect to "/tags"
end
