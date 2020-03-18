require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/merchant')
also_reload('../models/*')

get '/merchants' do
  @merchants = Merchant.all()
  erb(:"merchant/index")
end

get '/merchants/new' do
  erb(:"merchant/new")
end

post '/merchants' do
  @merchants = Merchant.new(params)
  @merchants.save()
  redirect to "/merchants"
end
