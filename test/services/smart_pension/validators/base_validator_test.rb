require 'test_helper'

module SmartPension
  module Validators
    class BaseValidatorTest < ActiveSupport::TestCase
      test '.valid?' do
        assert_raises(RuntimeError, 'Not implemented') { SmartPension::Validators::BaseValidator.valid?('test') }
      end
    end
  end
end
