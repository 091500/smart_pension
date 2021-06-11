module SmartPension
  module Validators
    class PagePathValidator < BaseValidator
      def self.valid?(item)
        item&.respond_to?(:page_path)
      end
    end
  end
end
