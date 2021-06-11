module SmartPension
  module Validators
    class PagePathValidator < BaseValidator
      def self.valid?(item)
        return false unless item
        return false unless item.respond_to?(:page_path)

        item.page_path.present?
      end
    end
  end
end
