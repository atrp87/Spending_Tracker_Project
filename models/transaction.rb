require_relative('../db/sql_runner.rb')
require_relative('./merchant')
require_relative('./tag')


class Transaction

  attr_reader   :id
  attr_accessor :vlaue, :tag_id, :merchant_id

  def initialize( options )
    @id          = options['id'].to_i if options['id']
    @value       = options['vlaue_id'].to_i
    @tag_id      = options['tag_id'].to_i
    @merchant_id = options['merchant_id'].to_i
  end

  def save()
    sql = "INSERT INTO transactions (value, tag_id, merchant_id)
    VALUES
    ($1, $2, $3, $4)
    RETURNING id"
    values = [@value, @tag_id, @merchant_id]
    result = SqlRunner.run(sql, values)
    id = result.first['id']
    @id = id.to_i
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

  def update()
    sql = "UPDATE transactions SET (vlaue, tag_id, merchant_id) =
    ($1, $2, $3, $4)
    WHERE id = $5"
    values = [@id, @value, @tag_id, @merchant_id]
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

  def merchant
    sql = "SELECT * FROM merchants WHERE id = $1"
    values = [@merchant_id]
    merchant = SqlRunner.run(sql, values)
    return Merchant.new(merchant.first)
  end

  def tag
    sql = "SELECT * FROM tags WHERE id = $1"
    values = [@tag_id]
    tag = SqlRunner.run(sql, values)
    return Tag.new(tag.first)
  end

end
