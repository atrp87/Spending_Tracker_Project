require_relative('../models/transaction')
require_relative('../models/merchant')
require_relative('../models/tag')
require_relative('sql_runner')

Transaction.delete_all()
Merchant.delete_all()
Tag.delete_all()


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

transaction1 = Transaction.new({ 'merchant_id' => merchant1.id, 'tag_id' => tag1.id, 'value' => 60 })
transaction2 = Transaction.new({ 'merchant_id' => merchant2.id, 'tag_id' => tag2.id, 'vlaue' => 20 })
transaction3 = Transaction.new({ 'merchant_id' => merchant3.id, 'tag_id' => tag3.id, 'vlaue' => 45 })

transaction1.save()
transaction2.save()  
transaction3.save()
