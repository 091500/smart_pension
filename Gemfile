source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.6'

gem 'thor'
gem 'rake'

group :development, :test do
  gem 'rspec'
  gem 'rdoc'
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
