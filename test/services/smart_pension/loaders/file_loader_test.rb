require 'test_helper'

module SmartPension
  module Loaders
    class FileLoaderTest < ActiveSupport::TestCase
      test '#initialize' do
        assert SmartPension::Loaders::FileLoader.new(file_path: :file_path)
      end
    end
  end
end
