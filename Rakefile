require 'bundler/gem_tasks'

task :default => :test
task :test do
  Dir.glob('./test/*_test.rb').each { |file| require file}
end

namespace :test do
  namespace :db do

    desc "Create test database"
    task :create do
      require './config/database.rb'

      case DB_TYPE
        when :mysql
          require 'yaml'
          require 'pg'
          ActiveRecord::Base.connection.execute "CREATE DATABASE #{DATABASE_NAME}"
        when :postgres
          require 'yaml'
          require 'mysql2'
          ActiveRecord::Base.connection.execute "CREATE DATABASE #{DATABASE_NAME}"
        else
          raise "Unknown database type: #{DB_TYPE}"
      end
      puts "Test database \"#{DATABASE_NAME}\" created."
    end

  end
end
