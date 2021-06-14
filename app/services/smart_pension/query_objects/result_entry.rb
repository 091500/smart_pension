# frozen_string_literal: true

module SmartPension
  module QueryObjects
    # query object implementation for ResultEntry
    class ResultEntry
      def initialize(initial_scope = nil)
        @initial_scope = initial_scope
      end

      # returns scoped data
      def call(**params)
        sort_desc(@initial_scope, params[:sort_desc])
      end

      private

      # returns sorted by desc scope
      def sort_desc(scoped, sort)
        sort ? Hash[scoped.sort_by { |_name, values| values.count }.reverse] : scoped
      end
    end
  end
end
