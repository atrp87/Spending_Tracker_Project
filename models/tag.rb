require_relative('transaction.rb')
require_relative('merchant.rb')
require_relative('../db/sql_runner.rb')

class Tag

  attr_reader   :id
  attr_accessor :name

  def initialize( options )
    @id   = options['id'].to_i if options['id']
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO tags (name) VALUES ($1) RETURNING id"
    values = [@name]
    result = SqlRunner.run(sql, values)
    id = result.first["id"]
    @id = id.to_i
  end

  def self.all()
    sql = "SELECT * FROM tags"
    tags = SqlRunner.run(sql)
    result = tags.map { |tag| Tag.new(tag) }
    return result
  end

  def self.find(id)
    sql = "SELECT * FROM tags
    WHERE id = $1"
    values = [id]
    tag_data = SqlRunner.run(sql, values)
    return Tag.map_item(tag_data)
  end

  def update()
    sql = "UPDATE tags SET (name) = ($1) WHERE id = $2"
    values = [@id, @name]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM tags WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM tags"
    SqlRunner.run(sql)
  end

end
