# frozen_string_literal: true

require_relative '../../../test_helper'
require 'minitest/autorun'
require_relative '../../../../smart_pension/presenters/uniq_views'

module SmartPension
  module Presenters
    class UniqViewsTest < Minitest::Test
      def test_initialize
        assert UniqViews.new
      end

      def test_show
        data = {
          '/test' => [1, 2, 3],
          '/about' => [1]
        }

        assert_equal("/test 3 unique views\n/about 1 unique views", UniqViews.new(data).show)
      end
    end
  end
end
