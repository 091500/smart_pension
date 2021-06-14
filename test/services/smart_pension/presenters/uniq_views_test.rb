# frozen_string_literal: true

require 'test_helper'
require 'ostruct'

module SmartPension
  module Presenters
    class UniqViewsTest < ActiveSupport::TestCase
      test '#initialize' do
        assert UniqViews.new
      end

      test '#show' do
        data = {
          '/test' => [1, 2, 3],
          '/about' => [1]
        }

        assert_equal("/test 3 unique views\n/about 1 unique views", UniqViews.new(data).show)
      end
    end
  end
end
