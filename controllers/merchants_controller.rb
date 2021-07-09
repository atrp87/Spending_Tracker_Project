require_relative('../models/merchant')
require('sinatra/contrib/all') if development?
require('sinatra')

get '/merchants' do
  @merchants = Merchant.all()
  erb(:'merchants/index')
end

post '/merchants' do
  @merchant = Merchant.new(params)
  @merchant.save()
  redirect to ('/merchants')
end

get '/merchants/:id/edit' do
  @merchant = Merchant.find(params[:id].to_i)
  erb(:'merchants/edit')
end

post '/merchants/:id' do
  update = Merchant.new(params)
  update.update()
  redirect to ('/merchants')
end

post '/merchants/:id/delete' do
  Merchant.destroy(params[:id])
  redirect to ('/merchants')
end