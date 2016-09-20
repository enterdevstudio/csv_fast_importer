require "bundler/gem_tasks"

task :default => :test
task :test do
  Dir.glob('./test/*_test.rb').each { |file| require file}
end

namespace :test do
  namespace :db do

    desc "Create test database"
    task :create do
      case ENV['DB_TYPE']
        when "mysql"; createMysqlDatabase
        else;         createPostgreSQLDatabase
      end
    end

    def createPostgreSQLDatabase
      require 'yaml'
      require "pg"
      db_config = YAML.load_file('spec/config/database.postgres.yml')
      database_name = db_config['database']
      connection = PG.connect dbname: 'postgres', host: db_config['host'], port: db_config['port']
      connection.exec "CREATE DATABASE #{database_name}"
      puts "Test database \"#{database_name}\" created."
    end

    def createMysqlDatabase
      require 'yaml'
      require "mysql2"
      db_config = YAML.load_file('spec/config/database.mysql.yml')
      database_name = db_config['database']
      client = Mysql2::Client.new host: db_config['host'] #, username: db_config['username']
      client.query "CREATE DATABASE #{database_name}"
      client.close
      puts "Test database \"#{database_name}\" created."
    end

  end
end
