require 'yaml'
require 'pathname'

ALL_DB_TYPES = [:postgres, :mysql]
DB_TYPE = (ENV['DB_TYPE'] || :postgres).to_sym

unless ALL_DB_TYPES.include?(DB_TYPE)
  raise "Unknown database: #{DB_TYPE}. Database type is defined with environment variabe \"DB_TYPE\". Allowed values: #{ALL_DB_TYPES}"
end

config_file = Pathname.new(File.dirname(__FILE__)).join("database.#{DB_TYPE}.yml")
DATABASE_CONFIG = YAML.load_file(config_file)

if ENV.has_key? "DB_USERNAME"
  DATABASE_CONFIG["username"] = ENV["DB_USERNAME"]
end
DATABASE_NAME = DATABASE_CONFIG["database"]

def establish_connection
  require 'active_record'
  ActiveRecord::Base.configurations["test"] = DATABASE_CONFIG
  ActiveRecord::Base.establish_connection :test
end
