require 'test_helper'

module SmartPension
  module Readers
    class BaseTest < ActiveSupport::TestCase
      test '#initialize' do
        assert Base.new
      end

      test '#valid_entries' do
        assert_equal([], Base.new.valid_entries)
      end
    end
  end
end
