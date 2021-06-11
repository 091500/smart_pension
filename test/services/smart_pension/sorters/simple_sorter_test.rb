require 'test_helper'

module SmartPension
  module Sorters
    class SimpleSorterTest < ActiveSupport::TestCase
      test '#initialize' do
        assert_raises(RuntimeError, 'Not Implemented') { SmartPension::Sorters::SimpleSorter.new }
      end
    end
  end
end
