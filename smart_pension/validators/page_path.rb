# frozen_string_literal: true

require_relative 'base'

module SmartPension
  module Validators
    # page path validator
    class PagePath < Base
      # validates page path
      def self.valid?(item = nil)
        return false unless item
        return false unless item.respond_to?(:page_path)

        page_path = item.page_path
        page_path&.match?(/^\//)
      end
    end
  end
end
