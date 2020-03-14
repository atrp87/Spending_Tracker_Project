require_relative('../db/sql_runner')

class Merchant

  attr_reader   :id
  attr_accessor :name

  def initialize( options )
    @id   = options['id'].to_i if options['id']
    @name = options['name']
    #@price
  end

  def save()
    sql = "INSERT INTO merchants (name) VALUES ($1) RETURNING id"
    values = [@name]
    result = SqlRunner.run(sql, values)
    id = result.first["id"]
    @id = id.to_i
  end

  def update()
    sql = "UPDATE merchants SET (name) = ($1) WHERE id = $2"
    values = [@id, @name]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM merchants WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM merchants"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM merchants"
    merchants = SqlRunner.run(sql)
    result = merchants.map { |merchant| Mercant.new(merchant) }
    return result
  end

  def self.find(id)
    sql = "SELECT * FROM merchants
    WHERE id = $1"
    values = [id]
    merchant_data = SqlRunner.run(sql, values)
    return Merchant.map_item(merchant_data)
  end

end
