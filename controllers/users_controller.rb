require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/user')
also_reload('../models/*')


get '/users' do
  @users = User.all()
  erb(:index)
end
