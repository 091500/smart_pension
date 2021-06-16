# frozen_string_literal: true

require_relative '../../../test_helper'
require 'minitest/autorun'
require_relative '../../../../smart_pension/presenters/base'

module SmartPension
  module Presenters
    class BaseTest < Minitest::Test
      def test_initialize
        assert Base.new
      end

      def test_show
        assert_raises(RuntimeError, 'Not implemented') { Base.new.show }
      end
    end
  end
end
