require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/tag')
also_reload('../models/*')


get '/tags' do
  @tags = Tag.all()
  erb (:"tag/index")
end

get '/tags/new' do
  @tags = Tag.all()
  erb (:"tag/new")
end

post '/tags/new' do
  @tags = Tag.all()
  Tag.new(params).save()
  redirect('/tag')
end

get '/tags/:id/edit' do
  @tags = Tag.find(params['id'])
  erb (:"tag/edit")
end

post '/tags/:id/edit' do
  tag = Tag.new(params)
  tag.update()
  redirect ('/tag')
end

get '/tags/:id' do
  @tags = Tag.find(params['id'])
  erb (:"tag/show")
end

post '/tags/:id/delete' do
  @tags = Tag.find(params['id'])
  @tags.delete()
  redirect('/tag')
end
