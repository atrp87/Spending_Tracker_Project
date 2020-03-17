require_relative('transaction')
require_relative('tag')
require_relative('../db/sql_runner.rb')

class User

  attr_reader   :id
  attr_accessor :username, :budget

  def initialize( options )
    @id       = options['id'].to_i if options['id']
    @username = options['username']
    @budget   = options['budget'].to_i if options['budget']
  end

  def save()
    sql = "INSERT INTO users (username, budget) VALUES ($1, $2) RETURNING id"
    values = [@username, @budget]
    result = SqlRunner.run(sql, values)
    id = result.first["id"]
    @id = id.to_i
  end

  def update()
    sql = "UPDATE users SET (username, budget) = ($1, $2) WHERE id = $3"
    values = [@id, @username, @budget]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM users WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM users"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM users"
    users = SqlRunner.run(sql)
    result = users.map { |user| User.new(user) }
    return result
  end

  def self.find(id)
    sql = "SELECT * FROM users WHERE id = $1"
    values = [id]
    user_data = SqlRunner.run(sql, values)
    return User.map_item(user_data)
  end

end
