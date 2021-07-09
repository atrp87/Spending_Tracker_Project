require_relative('../models/transaction')
require('sinatra/contrib/all')
require('sinatra')
also_reload('../models/*')

get '/transactions' do
  @transactions = Transaction.all()
  @merchants = Merchant.all()
  @tags = Tag.all()
  @total = Transaction.total()
  erb( :'transactions/index' )
end

get '/transactions/merchants' do
  @transactions = Transaction.filter_by_merchant(params[:merchant_id].to_i)
  @merchants = Merchant.all()
  @tags = Tag.all()
  @total = Transaction.merchants_total(params[:merchant_id].to_i)
  erb( :'transactions/index')
end

get '/transactions/tags' do
  @transactions = Transaction.filter_by_tag(params[:tag_id].to_i)
  @merchants = Merchant.all()
  @tags = Tag.all()
  @total = Transaction.tags_total(params[:tag_id].to_i)
  erb( :'transactions/index')
end

post '/transactions' do
  @transaction = Transaction.new(params)
  @transaction.save
  redirect to ('/transactions')
end

get '/transactions/:id/edit' do
  @transaction = Transaction.find(params[:id].to_i)
  @tags = Tag.all
  @merchants = Merchant.all
  erb( :'transactions/edit')
end

post '/transactions/:id' do
  update = Transaction.new(params)
  update.update()
  redirect to ('/transactions')
end

post '/transactions/:id/delete' do
  Transaction.destroy(params[:id])
  redirect to '/transactions'
end