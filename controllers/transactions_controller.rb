require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/transaction')
also_reload('../models/*')

get '/transactions' do
  @transaction = Transaction.order()
  erb( :"transaction/index" )
end

get '/transactions/new' do
  @merchants = Merchant.all()
  @tags = Tag.all()
  erb ( :"transaction/new")
end

post '/transactions/new' do
  @transaction = Transaction.new(params)
  @transaction.save()
  redirect('/transaction')
end

get '/transactions/:id' do
  @transactions = Transaction.find(params['id'])
  erb (:"transaction/index")
end

post '/transactions/:id/delete' do
  @transaction = Transaction.find(params['id'])
  @transaction.delete()
  redirect ('/transaction')
end

