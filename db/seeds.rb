require_relative('../models/transcation')
require_relative('../models/merchant')
require_relative('../models/user')
require_relative('../models/tag')
require_relative('sql_runner')

require( 'pry')

Transaction.delete_all()
Merchant.delete_all()
User.delete_all()
Tag.delete_all()

user = User.new({ 'username' => 'Andrew', 'budget' => 300 })

user.save()

merchant1 = Merchant.new({ 'name' => 'Amazon' })
merchant2 = Merchant.new({ 'name' => 'Costco' })
merchant3 = Merchant.new({ 'name' => 'ASDA' })

merchant1.save()
merchant2.save()
merchant3.save()

tag1 = Tag.new({ 'name' => 'Bussiness' })
tag2 = Tag.new({ 'name' => 'Leisure' })
tag3 = Tag.new({ 'name' => 'Groceries' })

tag1.save()
tag2.save()
tag3.save()

# transaction1 = Transaction.new({ 'user_id' => 'user.id', 'budget' => -100, 'tag_id' => tag1.id, 'merchant_id' => merchant1.id, 'budget' => -100 })
#
# transaction1.save()

biding.pry
nil
