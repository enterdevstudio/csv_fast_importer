require 'bundler/gem_tasks'

task :default => :test
task :test do
  Dir.glob('./test/*_test.rb').each { |file| require file}
end

namespace :test do
  namespace :db do

    require 'config/database.rb'

    desc "Create test database"
    task :create do
      require 'active_record'
      case DB_TYPE
        when :mysql;    createMysqlDatabase)
        when :postgres; createPostgreSQLDatabase
        else;           raise "Unknown database type: #{DB_TYPE}"
      end
      puts "Test database \"#{DATABASE_NAME}\" created."
    end

    def createPostgreSQLDatabase
      require 'yaml'
      require 'pg'
      ActiveRecord::Base.connection.execute "CREATE DATABASE #{DATABASE_NAME}"
    end

    def createMysqlDatabase
      require 'yaml'
      require 'mysql2'
      ActiveRecord::Base.connection.execute "CREATE DATABASE #{DATABASE_NAME}"
    end

  end
end
