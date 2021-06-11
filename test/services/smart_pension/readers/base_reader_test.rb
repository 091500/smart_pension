require 'test_helper'

module SmartPension
  module Readers
    class BaseReaderTest < ActiveSupport::TestCase
      test '#initialize' do
        assert_raises(RuntimeError, 'Not Implemented') { SmartPension::Readers::BaseReader.new }
      end
    end
  end
end
