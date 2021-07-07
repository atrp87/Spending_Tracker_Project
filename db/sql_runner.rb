# require( 'pg' )

# class SqlRunner

#   def self.run( sql, values = [] )
#     begin
#       # Local Host.
#       db = PG.connect ( { dbname: 'spending_tracker', host: 'localhost' } )
#       # Heroku.
#       # db = PG.connect( { dbname: 'd3k6ovivv66fhd',
#       # host: 'ec2-54-211-77-238.compute-1.amazonaws.com',
#       # port:'5432', user 'zerjcrsuwjnbzz', 
#       # password: 'f41e085d772f8e2c19a57d0ade5a5a5e3b9aa04a952c4b487e5d943bea8a7fa0'})
#       db.prepare("query", sql)
#       result = db.exec_prepared( "query", values )
#     ensure
#       db.close() if db != nil
#     end
#     return result
#   end

# end


require('pg')

class SqlRunner

  def self.run(sql, values = [])
    begin
      db = PG.connect({dbname: 'spending_tracker', host: 'localhost'})
      db.prepare("query", sql)
      result = db.exec_prepared("query", values)
    ensure
      db.close() if db != nil
    end
    return result
  end

end
