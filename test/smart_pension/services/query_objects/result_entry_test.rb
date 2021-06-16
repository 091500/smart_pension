# frozen_string_literal: true

require_relative '../../../test_helper'
require 'minitest/autorun'
require_relative '../../../../smart_pension/query_objects/result_entry'

module SmartPension
  module QueryObjects
    class ResultEntryTest < Minitest::Test
      def test_initialize
        assert ResultEntry.new
      end

      def test_call_without_params
        assert_equal(initial_scope, QueryObjects::ResultEntry.new(initial_scope).call)
      end

      def test_call_with_params_sort_desc_false
        assert_equal(initial_scope, QueryObjects::ResultEntry.new(initial_scope).call(sort_desc: false))
      end

      def test_call_with_params_sort_desc_true
        expected = {
          '/main' => [1, 2, 3],
          '/joke' => [1, 2],
          '/test' => [1]
        }

        assert_equal(expected, QueryObjects::ResultEntry.new(initial_scope).call(sort_desc: true))
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
