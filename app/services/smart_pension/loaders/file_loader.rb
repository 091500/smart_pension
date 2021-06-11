module SmartPension
  module Loaders
    class FileLoader < BaseLoader
      def initialize(file_path:)
        @file_path = file_path
      end
    end
  end
end
