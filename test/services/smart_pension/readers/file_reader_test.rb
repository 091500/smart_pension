require 'test_helper'

module SmartPension
  module Readers
    class FileReaderTest < ActiveSupport::TestCase
      test '#initialize' do
        assert SmartPension::Readers::FileReader.new(file_path: :file_path)
      end
    end
  end
end
