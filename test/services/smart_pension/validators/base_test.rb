# frozen_string_literal: true

require 'test_helper'

module SmartPension
  module Validators
    class BaseTest < ActiveSupport::TestCase
      test '.valid?' do
        assert_raises(RuntimeError, 'Not implemented') { Base.valid?('test') }
      end
    end
  end
end
