source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.0'

gem 'rake'

group :development, :test do
  gem 'rspec'
  # for ENV['secret'] variables. Add .env file in root folder
  gem 'dotenv'
end

group :development do
  gem 'rubocop', require: false
end

group :test do
  gem 'minitest'
  gem 'simplecov', require: false
  gem 'codecov', require: false
end
