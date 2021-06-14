# frozen_string_literal: true

require 'test_helper'
require 'ostruct'

module SmartPension
  module Presenters
    class UniqPagesTest < ActiveSupport::TestCase
      test '#initialize' do
        assert UniqPages.new
      end

      test '#show' do
        data = {
          '/test' => [1, 2, 3],
          '/about' => [1]
        }

        assert_equal("/test 3 visits\n/about 1 visits", UniqPages.new(data).show)
      end
    end
  end
end
