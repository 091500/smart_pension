# frozen_string_literal: true

module LogParser
  module Presenters
    # base presenter
    class Base
      def initialize(data = {})
        @data = data
      end

      # must be overridden
      def show
        raise 'Not implemented'
      end

      private

      attr_reader :data
    end
  end
end
