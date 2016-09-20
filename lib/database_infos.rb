module DatabaseInfos
  def databaseInfos
    ActiveRecord::Base.connection.select_value 'select version()'
  end

  def postgreSQL
    databaseInfos.match /PostgreSQL/
  end
end
