require 'codacy-coverage'
Codacy::Reporter.start

require 'active_record'
require 'pathname'

ROOT_DIR = Pathname.new(File.dirname(__FILE__)).join("../..")

require ROOT_DIR.join('config/database.rb')

%w(database_helper spec_helper database_helper).each do |file|
  require ROOT_DIR.join('spec/support').join(file)
end

Dir[ROOT_DIR.join("spec/context/**/*.rb")].each { |f| require f }


