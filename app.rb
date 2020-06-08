require( 'sinatra' )
require( 'sinatra/contrib/all' )

require_relative('models/tag')
require_relative('models/merchant')
require_relative('models/transaction')
also_reload('./models/*')

require_relative('controllers/transactions_controller')
require_relative('controllers/merchants_controller')
require_relative('controllers/tags_controller')

get '/' do
  erb(:index)
end
