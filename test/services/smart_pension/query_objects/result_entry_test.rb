require 'test_helper'
require 'ostruct'

module SmartPension
  module QueryObjects
    class ResultEntryTest < ActiveSupport::TestCase
      test '#initialize' do
        assert ResultEntry.new
      end

      test '#call without params' do
        assert_equal(initial_scope, ResultEntry.new(initial_scope).call)
      end

      test '#call with params sort_desc = false' do
        assert_equal(initial_scope, ResultEntry.new(initial_scope).call(sort_desc: false))
      end

      test '#call with params sort_desc = true' do
        expected = {
          '/main' => [1, 2, 3],
          '/joke' => [1, 2],
          '/test' => [1]
        }

        assert_equal(expected, ResultEntry.new(initial_scope).call(sort_desc: true))
      end

      private

      def initial_scope
        {
          '/test' => [1],
          '/joke' => [1, 2],
          '/main' => [1, 2, 3]
        }
      end
    end
  end
end
