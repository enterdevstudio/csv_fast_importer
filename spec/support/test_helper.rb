require 'codacy-coverage'
Codacy::Reporter.start

require 'active_record'
require 'pathname'

TEST_DIR = Pathname.new File.dirname(__FILE__)
DB_TYPE = (ENV['DB_TYPE'] || :postgres).to_sym

%w(database_helper spec_helper database_helper).each { |file| require TEST_DIR.join(file) }
Dir[File.dirname(__FILE__) + "/../context/**/*.rb"].each {|f| require f }


