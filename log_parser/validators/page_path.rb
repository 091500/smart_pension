# frozen_string_literal: true

require_relative 'base'

module LogParser
  module Validators
    # page path validator
    class PagePath < Base
      # validates page path
      def self.valid?(page = nil)
        return false unless page

        page.match?(/^\//)
      end
    end
  end
end
