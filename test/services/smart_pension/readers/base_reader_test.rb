require 'test_helper'

module SmartPension
  module Readers
    class BaseReaderTest < ActiveSupport::TestCase
      test '#initialize' do
        assert SmartPension::Readers::BaseReader.new
      end

      test '#valid_entries' do
        assert_equal([], SmartPension::Readers::BaseReader.new.valid_entries)
      end
    end
  end
end
