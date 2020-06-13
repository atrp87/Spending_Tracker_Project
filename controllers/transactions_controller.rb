require('sinatra')
require('sinatra/contrib/all')

require_relative('../models/transaction')
require_relative('../models/merchant')
require_relative('../models/tag')

also_reload('../models/*')

get '/transaction' do
  @transaction = Transaction.all()
  erb( :"transactions/index" )
end

get '/transaction/new' do
  @merchants = Merchant.all()
  @tags = Tag.all()
  erb ( :"transactions/new")
end

post '/transaction/new' do
  @transaction = Transaction.all()
  Transaction.new(params).save()
  redirect('/transaction')
end

get '/transaction/:id' do
  @transactions = Transaction.find(params['id'])
  erb (:"transactions/index")
end

post '/transaction/:id/delete' do
  @transaction = Transaction.find(params['id'])
  @transaction.delete()
  redirect ('/transaction')
end