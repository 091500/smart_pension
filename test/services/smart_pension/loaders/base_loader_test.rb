require 'test_helper'

module SmartPension
  module Loaders
    class BaseLoaderTest < ActiveSupport::TestCase
      test '#initialize' do
        assert_raises(RuntimeError, 'Not Implemented') { SmartPension::Loaders::BaseLoader.new }
      end
    end
  end
end
