require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/merchant')
also_reload('../models/*')


get '/merchants' do
  @merchants = Merchant.all()
  erb (:"merchant/index")
end

get '/merchants/new' do
  @merchants = Merchant.all()
  erb ( :"merchant/new")
end

post '/merchant/snew' do
  @merchants = Merchant.all()
  Merchant.new(params).save()
  redirect('/merchant')
end

get '/merchants/:id/edit' do
  @merchants = Merchant.find(params['id'])
  erb (:"merchant/edit")
end

post '/merchants/:id/edit' do
  merchant = Merchant.new(params)
  merchant.update
  redirect ('/merchant')
end


get '/merchants/:id' do
  @merchants = Merchant.find(params['id'])
  erb (:"merchant/show")
end

post '/merchants/:id/delete' do
  @merchant = Merchant.find(params['id'])
  @merchant.delete()
  redirect ('/merchant')
end
