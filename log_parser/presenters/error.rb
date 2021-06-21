# frozen_string_literal: true

module LogParser
  module Presenters
    # presents page views
    class Error
      def initialize(errors = [])
        @errors = errors
      end

      # returns formatted data
      def show
        return if @errors.count == 0
        "There was an error: #{@errors.join(', ')}"
      end
    end
  end
end
