# frozen_string_literal: true

require_relative 'reader_initializer'
require_relative 'entities/result_entry'
require_relative 'query_objects/result_entry'
require_relative 'presenters/uniq_pages'
require_relative 'presenters/uniq_views'
require_relative 'presenters/result'
require_relative 'presenters/error'
require_relative 'validators/error'


module LogParser
  # initializes reader_initializer and parses reader_initializer content
  class Parser
    def initialize(
      reader_initializer_class: ReaderInitializer,
      result_entry_class: Entities::ResultEntry,
      query_object_class: QueryObjects::ResultEntry,
      uniq_pages_presenter_class: Presenters::UniqPages,
      uniq_views_presenter_class: Presenters::UniqViews,
      result_presenter_class: Presenters::Result,
      error_presenter_class: Presenters::Error,
      error_validator_class: Validators::Error
    )
      @reader_initializer_class = reader_initializer_class
      @result_entry_class = result_entry_class
      @query_object_class = query_object_class
      @uniq_pages_presenter_class = uniq_pages_presenter_class
      @uniq_views_presenter_class = uniq_views_presenter_class
      @result_presenter_class = result_presenter_class
      @error_presenter_class = error_presenter_class
      @error_validator_class = error_validator_class
      @result = ''
      @errors = []
    end

    # returns parsed data
    # outputs data if puts_enabled = true
    def parse(arg = nil, puts_enabled: false)
      reader_initializer = @reader_initializer_class.new(arg)

      validate(arg, reader_initializer)

      on_success do
        @result = prepare_result(reader_initializer)
      end

      on_failure do
        @result = prepare_errors
      end

      puts @result if puts_enabled
      @result
    end

    private

    def validate(path, reader)
      @errors = @error_validator_class.new(path, reader).validate
    end

    def prepare_result(reader)
      result_entry = @result_entry_class.new
      reader.each { |log_entry| result_entry << log_entry }

      uniq_pages = @uniq_pages_presenter_class.new(@query_object_class.new(result_entry.uniq_pages).call(sort_desc: true))
      uniq_views = @uniq_views_presenter_class.new(@query_object_class.new(result_entry.uniq_views).call(sort_desc: true))

      result = @result_presenter_class.new
      result << "Page views, sort order desc:"
      result << uniq_pages.show
      result << "Uniq page visits, sort order desc:"
      result << uniq_views.show
      result.show
    end

    def prepare_errors
      @error_presenter_class.new(@errors).show
    end

    def on_success
      yield if @errors.empty?
    end

    def on_failure
      yield if @errors.any?
    end
  end
end
