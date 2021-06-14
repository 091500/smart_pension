# frozen_string_literal: true

require 'simplecov'
SimpleCov.start 'rails' do
  add_group 'Models', 'app/models'
  add_group 'Services', 'app/services'
  add_filter '/bin/'
  add_filter '/db/'
  add_filter '/spec/'
  add_filter '/test/'
  add_filter '/channels/'
  add_filter '/mailers/'
  add_filter '/controllers/'
  add_filter '/models/smart_pension/ar/'
  add_filter '/models/application_record.rb'
  add_filter '/jobs/application_job.rb'
  add_filter '/helpers/application_helper.rb'
  add_filter 'parser.rb'
end

require 'codecov'
SimpleCov.formatter = SimpleCov::Formatter::Codecov

ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
require 'minitest/mock'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end
