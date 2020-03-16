require('sinatra')
require('sinatra/contrib/all')
require_relative('models/transaction')
require_relative('models/merchant')
require_relative('models/user')
require_relative('models/tag')
also_reload('models/*')


get '/home' do
  @users = User.all
  erb(:index)
end

get '/home/new' do
  @merchants = Merchant.all
  @tags = Tag.all
 erb(:new)
end

post '/home/new/save' do

  erb(:save)
end
