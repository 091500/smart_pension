require 'test_helper'

module SmartPension
  module Sorters
    class BaseSorterTest < ActiveSupport::TestCase
      test '#initialize' do
        assert SmartPension::Sorters::BaseSorter.new
      end
    end
  end
end
