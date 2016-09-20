require 'csv_fast_importer'
require_relative 'support/test_helper'
require_relative 'support/csv_writer'

describe CsvFastImporter do
  include_context 'test_kaamelott table with columns row_index, id and label'

  describe 'when mysql', mysql: true do
    before do
      begin
        file = write_file [ %w(id, bad_column_name), %w(1, random_value1) ]
        CsvFastImporter.import file
        raise 'Unexpected here. Exception should have been raised'
      rescue Exception => e
        @raised_exception = e
      end
    end

    it 'should fail with error message about database type' do
      @raised_exception.should match(/Invalid database type/)
    end
  end
end
