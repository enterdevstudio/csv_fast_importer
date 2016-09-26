ALL_DB_TYPES = [:postgres, :mysql]
DB_TYPE = (ENV['DB_TYPE'] || :postgres).to_sym

unless ALL_DB_TYPES.include?(DB_TYPE)
  raise "Unknown database: DB_TYPE (database type is defined with environment variabe \"DB_TYPE\"). Only allowed: #{ALL_DB_TYPES}"
end

ActiveRecord::Base.configurations["test"] = YAML.load_file("config/database.#{DB_TYPE}.yml")
DATABASE_NAME = ActiveRecord::Base.configurations["test"][:database]
if ENV.has_key? "DB_USERNAME"
  ActiveRecord::Base.configurations["test"][:username] = ENV["DB_USERNAME"]
end
ActiveRecord::Base.establish_connection :test
