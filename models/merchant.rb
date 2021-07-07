require_relative('../db/sql_runner')

class Merchant
  
  attr_reader   :id
  attr_accessor :name

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
  end

  def save()
    sql = 'INSERT INTO merchants
    (name) VALUES ($1) RETURNING *'
    values = [@name]
    merchant = SqlRunner.run(sql, values).first
    @id = merchant['id'].to_i
  end

  def update()
    sql = 'UPDATE merchants
    SET name = $1
    WHERE id = $2'
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end

    def self.destroy(id)
    sql = "DELETE FROM transactions
    WHERE merchant_id = $1"
    values = [id]
    SqlRunner.run(sql, values)
    sql = "DELETE FROM merchants WHERE id = $1"
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = 'SELECT * FROM merchants'
    data = SqlRunner.run(sql)
    return Merchant.map_items(data)
  end

  def self.delete_all()
    sql = 'DELETE FROM merchants'
    SqlRunner.run(sql)
  end

  def self.map_items(data)
    result = data.map { |merchant| Merchant.new(merchant) }
    return result
  end

  def self.find(id)
    sql = 'SELECT * FROM merchants
    WHERE id = $1'
    values = [id]
    result = SqlRunner.run(sql, values)
    return Merchant.new(result.first)
  end

end