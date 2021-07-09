require_relative('../models/tag')
require('sinatra/contrib/all') if development?
require('sinatra')

get '/tags' do
  @tags = Tag.all()
  erb(:'tags/index')
end

post '/tags' do
  @tag = Tag.new(params)
  @tag.save()
  redirect to ('/tags')
end

get '/tags/:id/edit' do
  @tag = Tag.find(params[:id].to_i)
  erb(:'tags/edit')
end

post '/tags/:id' do
  update = Tag.new(params)
  update.update()
  redirect to ('/tags')
end

post '/tags/:id/delete' do
  Tag.destroy(params[:id])
  redirect to ('/tags')
end