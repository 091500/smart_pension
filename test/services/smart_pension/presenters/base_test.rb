require 'test_helper'

module SmartPension
  module Presenters
    class BaseTest < ActiveSupport::TestCase
      test '#initialize' do
        assert Base.new
      end

      test '#show' do
        assert_raises(RuntimeError, 'Not implemented') { Base.new.show }
      end
    end
  end
end
