# frozen_string_literal: true

require_relative '../../../test_helper'
require 'minitest/autorun'
require_relative '../../../../smart_pension/presenters/uniq_pages'

module SmartPension
  module Presenters
    class UniqPagesTest < Minitest::Test
      def test_initialize
        assert UniqPages.new
      end

      def test_show
        data = {
          '/test' => [1, 2, 3],
          '/about' => [1]
        }

        assert_equal("/test 3 visits\n/about 1 visits", UniqPages.new(data).show)
      end
    end
  end
end
