require_relative('../models/transaction')
require_relative('../models/merchant')
require_relative('../models/budget')
require_relative('../models/tag')

Transaction.delete_all()
Merchant.delete_all()
Budget.delete_all()
Tag.delete_all()

tag1 = Tag.new({ 'name' => 'Groceries' })
tag2 = Tag.new({ 'name' => 'Business' })
tag3 = Tag.new({ 'name' => 'Gym' })
tag4 = Tag.new({ 'name' => 'Entertainment' })

tag1.save()
tag2.save()
tag3.save()
tag4.save()

merchant1 = Merchant.new({ 'name' => 'ASDA' })
merchant2 = Merchant.new({ 'name' => 'Amazon' })
merchant3 = Merchant.new({ 'name' => 'Omni Gym' })
merchant4 = Merchant.new({ 'name' => 'Netflix' })

merchant1.save()
merchant2.save()
merchant3.save()
merchant4.save()

transaction1 = Transaction.new({ 
  'tag_id' => tag1.id,
  'merchant_id' => merchant1.id,
  'amount' => 80.00
})

transaction2 = Transaction.new({
  'tag_id' => tag2.id,
  'merchant_id' => merchant2.id,
  'amount' => 35.00
})

transaction3 = Transaction.new({
  'tag_id' => tag3.id,
  'merchant_id' => merchant3.id,
  'amount' => 15.00
})

transaction4 = Transaction.new({ 
  'tag_id' => tag4.id,
  'merchant_id' => merchant4.id,
  'amount' => 12.00
})

transaction1.save()
transaction2.save()
transaction3.save()
transaction4.save()

budget1 = Budget.new({'amount' => 350.00})

budget1.save()