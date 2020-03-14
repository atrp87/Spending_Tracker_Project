require_relative('Merchant.rb')
require_relative('user.rb')
require_relative('tag.rb')
require_relative('../db/sql_runner.rb')

class Transaction

  attr_reader   :id
  attr_accessor :amount, :tag_id, :merchant_id, :user_id

  def initialize( options )
    @id          = options['id'].to_i if options['id']
    @amount      = options['amount_id'].to_i
    @tag_id      = options['tag_id'].to_i
    @merchant_id = options['merchant_id'].to_i
    @user_id     = options['merchant_id'].to_i
    #@date = another table ?
    #@time
  end

  def save()
    sql = "INSERT INTO transactions (amount, tag_id, merchant_id, user_id)
    VALUES
    ($1, $2, $3, £4)
    RETURNING id"
    values = [@amount, @tag_id, @merchant_id, @user_id]
    result = SqlRunner.run(sql, values)
    id = result.first['id']
    @id = id
  end

  def update()
    sql = "UPDATE transactions SET (amount, tag_id, merchant_id, user_id)
    =
    ($1, $2, $3, $4)
    WHERE id = $5"
    values = [@id, @amount, @tag_id, @merchant_id, @user_id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM transactions WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM transactions"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM transactions"
    transactions = SqlRunner.run(sql)
    result = transactions.map { |transaction| Transaction.new(transaction) }
    return result
  end

  def self.find(id)
    sql = "SELECT * FROM transactions
    WHERE id = $1"
    values = [id]
    transaction_data = SqlRunner.run(sql, values)
    return Transaction.map_item(transaction_data)
  end

end
