require 'simplecov'
SimpleCov.start 'rails' do
  add_group "Models", "app/models"
  add_filter '/bin/'
  add_filter '/db/'
  add_filter '/spec/'
  add_filter '/test/'
  add_filter '/channels/'
  add_filter '/mailers/'
  add_filter '/controllers/'
end

ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
require 'minitest/mock'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end
