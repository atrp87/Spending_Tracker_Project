require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/tag')
require_relative('../models/merchant')
require_relative('../models/transation')
also_reload('../models/*')

get '/home' do
  @transactions = Transaction.all
  erb(:index)
end

get '/add_transaction' do
  @transactions = Transaction.all
  @merchants = Merchant.all
  @tags = Tag.all
  erb(:"transactions/add_transaction")
end

get '/edit_transaction' do
  @transactions = Transaction.all
  @merchants = Merchant.all
  @tags = Tag.all
  erb(:"transactions/edit_transaction")
end

post '/add_transaction' do
  @transactions = Transaction.new( params )
  @transactions.save()
  erb(:"transactions/create")
end

get '/show' do
  @transactions = Transaction.all
  @tags = Tag.all
  erb(:"transactions/show")
end
@merchants = Merchant.all

post '/transactions/delete/:id' do
  transaction = Transaction.find_by_id(params[:id])
  transaction.delete
  redirect("/home")
end

get '/transactions/edit/:id' do
  @transaction = Transaction.find_by_id(params[:id])
  @merchants = Merchant.all
  @tags = Tag.all
  erb(:"transactions/edit_transaction")
end

post '/transactions/:id' do
  transaction = Transaction.new(params)
  transaction.update
  @transactions = Transaction.all
  erb(:"transactions/show")
end

# get '/transactions' do
#   @transaction = Transaction.order()
#   erb( :"transaction/index" )
# end

# get '/transactions/new' do
#   @merchants = Merchant.all()
#   @tags = Tag.all()
#   erb ( :"transaction/new")
# end

# post '/transactions/new' do
#   @transaction = Transaction.new(params)
#   @transaction.save()
#   redirect('/transaction')
# end

# get '/transactions/:id' do
#   @transactions = Transaction.find(params['id'])
#   erb (:"transaction/index")
# end

post '/transactions/:id/delete' do
  @transaction = Transaction.find(params['id'])
  @transaction.delete()
  redirect ('/transaction')
end

