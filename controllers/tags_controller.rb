require('sinatra')
require('sinatra/contrib/all') if development?

require_relative('../models/transaction')
require_relative('../models/merchant')
require_relative('../models/tag')

also_reload('../models/*')

get '/tag' do
  @tags = Tag.all()
  erb (:"tags/index")
end

get '/tag/new' do
  @tags = Tag.all()
  erb (:"tags/new")
end

post '/tag/new' do
  @tags = Tag.all()
  Tag.new(params).save()
  redirect('/tag')
end

get '/tag/:id/edit' do
  @tags = Tag.find(params['id'])
  erb (:"tags/edit")
end

post '/tag/:id/edit' do
  tag = Tag.new(params)
  tag.update()
  redirect ('/tag')
end

get '/tag/:id' do
  @tags = Tag.find(params['id'])
  erb (:"tags/show")
end

post '/tag/:id/delete' do
  @tags = Tag.find(params['id'])
  @tags.delete()
  redirect('/tag')
end
