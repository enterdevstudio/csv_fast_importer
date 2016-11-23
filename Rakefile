require 'bundler/gem_tasks'

namespace :test do
  namespace :db do

    desc "Create test database"
    task :create do

      require './spec/config/database.rb'

      case DB_TYPE
        when :postgres
          require 'pg'
          establish_connection
          ActiveRecord::Base.connection.execute "CREATE DATABASE #{DATABASE_NAME}"

        when :mysql
          require 'mysql2'
          MYSQL_DB_CREATION_CONFIG = { database: nil, username: 'root', flags: Mysql2::Client::MULTI_STATEMENTS }
          client = Mysql2::Client.new(DATABASE_CONFIG.merge(MYSQL_DB_CREATION_CONFIG))
          client.query <<-SQL
            CREATE DATABASE #{DATABASE_NAME};
            GRANT ALL ON #{DATABASE_NAME}.* TO '#{DATABASE_CONFIG['username']}'@'#{DATABASE_CONFIG['host']}';
            FLUSH PRIVILEGES;
          SQL
        else
          raise "Unknown database type: #{DB_TYPE}"
      end

      puts "Test database \"#{DATABASE_NAME}\" created."
    end

  end
end
