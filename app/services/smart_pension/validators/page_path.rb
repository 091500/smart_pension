# frozen_string_literal: true

module SmartPension
  module Validators
    class PagePath < Base
      def self.valid?(item = nil)
        return false unless item
        return false unless item.respond_to?(:page_path)

        page_path = item.page_path
        page_path.present? && page_path.starts_with?('/')
      end
    end
  end
end
