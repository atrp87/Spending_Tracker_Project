require_relative('../db/sql_runner.rb')
require_relative('./merchant')
require_relative('./tag')

class Transaction

  attr_reader   :id
  attr_accessor :value, :tag_id, :merchant_id

  def initialize(options)
    @cash        = 300
    @id          = options['id'].to_i if options['id']
    @value       = options['value'].to_i
    @tag_id      = options['tag_id'].to_i
    @merchant_id = options['merchant_id'].to_i
  end

  def merchant
        sql = 'SELECT * FROM merchants WHERE id = $1'
        values = [@merchant_id]
        merchant = SqlRunner.run(sql, values).first
        return Merchant.new(merchant)
  end

  def tag
        sql = 'SELECT * FROM tags WHERE id = $1'
        values = [@tag_id]
        tag = SqlRunner.run(sql, values).first
        return Tag.new(tag)
  end

  def save()
      sql = "INSERT INTO transactions (value, tag_id, merchant_id, cash)
        VALUES
      ($1, $2, $3, $4)
      RETURNING id"
      values = [@value, @tag_id, @merchant_id, @cash]
      result = SqlRunner.run(sql, values)
      id = result.first["id"]
      @id = id.to_i
  end

  def self.all()
      sql = "SELECT * FROM transactions"
      transactions = SqlRunner.run(sql)
      result = transactions.map { |transaction| Transaction.new( transaction ) }
      return result
  end

  def update()
      sql = "UPDATE transactions SET (value, tag_id, merchant_id, cash) = ($1, $2, $3) WHERE id = $4"
      values = [@value, @tag_id, @merchant_id, @id, @cash]
      SqlRunner.run(sql, values)
  end

  def self.delete_all()
      sql = "DELETE FROM transactions"
      SqlRunner.run(sql)
  end

  def delete()
      sql = "DELETE FROM transactions WHERE id = $1"
      values = [@id]
      SqlRunner.run(sql, values)
  end

  def self.find(id)
      sql = "SELECT * FROM transactions WHERE id = $1"
      values = [id]
      transaction = SqlRunner.run(sql, values)
      result = Transaction.new(transaction.first)
      return result
    end

    def self.all()
      sql = "SELECT * FROM transactions"
      transactions = SqlRunner.run(sql)
      result = transactions.map { |transaction| Transaction.new(transaction) }
      return result
    end
end