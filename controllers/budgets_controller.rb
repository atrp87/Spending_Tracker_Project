require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/budget')
also_reload('../models/*')

get '/budgets' do
  @budgets = Budget.all()
  @total = Transaction.total()
  erb( :'budgets/index')
end

get '/budgets/:id/edit' do
  @budget = Budget.find(params[:id].to_i)
  erb( :'budgets/edit')
end

post '/budgets/:id' do
  update = Budget.new(params)
  update.update()
  redirect to '/budgets'
end