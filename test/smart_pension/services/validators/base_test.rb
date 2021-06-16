# frozen_string_literal: true

require_relative '../../../test_helper'
require 'minitest/autorun'
require_relative '../../../../smart_pension/validators/base'

module SmartPension
  module Validators
    class BaseTest < Minitest::Test
      def test_valid
        assert_raises(RuntimeError, 'Not implemented') { Base.valid?('test') }
      end
    end
  end
end
