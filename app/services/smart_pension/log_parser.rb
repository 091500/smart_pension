module SmartPension
  class LogParser
    def initialize(
      reader_initializer_class: ReaderInitializer,
      result_entry_class: ResultEntry,
      query_object_class: QueryObjects::ResultEntry,
      uniq_pages_presenter_class: Presenters::UniqPages,
      uniq_views_presenter_class: Presenters::UniqViews
    )
      @reader_initializer_class = reader_initializer_class
      @result_entry_class = result_entry_class
      @query_object_class = query_object_class
      @uniq_pages_presenter_class = uniq_pages_presenter_class
      @uniq_views_presenter_class = uniq_views_presenter_class
    end

    def parse(arg = nil)
      first_arg = arg || ARGV[0]
      return 'Missing argument' unless first_arg

      begin
        result = @result_entry_class.new
        reader = @reader_initializer_class.new(first_arg)
        reader.each { |log_entry| result << log_entry }

        uniq_pages = @uniq_pages_presenter_class.new(@query_object_class.new(result.uniq_pages).call(sort_desc: true))
        uniq_views = @uniq_views_presenter_class.new(@query_object_class.new(result.uniq_views).call(sort_desc: true))

        puts "Page views, sort order desc:"
        puts uniq_pages.show

        puts

        puts "Uniq page visits, sort order desc:"
        puts uniq_views.show
      rescue Exception => e
        puts "There was an error: #{e.message}"
      end
    end
  end
end
