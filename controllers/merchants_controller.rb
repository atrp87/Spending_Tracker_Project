require('sinatra')
require('sinatra/contrib/all') if development?

require_relative('../models/transaction')
require_relative('../models/merchant')
require_relative('../models/tag')

also_reload('../models/*')

get '/merchant' do
  @merchants = Merchant.all()
  erb (:"merchants/index")
end

get '/merchant/new' do
  @merchants = Merchant.all()
  erb (:"merchants/new")
end

post '/merchant/new' do
  @merchants = Merchant.all()
  Merchant.new(params).save()
  redirect('/merchant')
end

get '/merchant/:id/edit' do
  @merchants = Merchant.find(params['id'])
  erb (:"merchants/edit")
end

post '/merchant/:id/edit' do
  merchant = Merchant.new(params)
  merchant.update
  redirect ('/merchant')
end

get '/merchant/:id' do
  @merchants = Merchant.find(params['id'])
  erb (:"merchants/show")
end

post '/merchant/:id/delete' do
  @merchant = Merchant.find(params['id'])
  @merchant.delete()
  redirect ('/merchant')
end