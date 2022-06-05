# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.2'

gem 'bootsnap', '~> 1.7.6', require: false
gem 'devise'
gem 'haml-rails', '~> 2.0'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.4'
gem 'rails', '~> 7.0'
gem 'rails-i18n', '~> 7.0'
gem 'stimulus-rails', '~> 1.0'
gem 'turbo-rails', '~> 1.1'
gem 'cssbundling-rails'
gem 'jsbundling-rails'
gem 'propshaft'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
end

group :development do
  gem 'listen', '~> 3.6'
  # gem 'rack-mini-profiler', '~> 2.0'
  gem 'rubocop', '~> 1.18'
  gem 'rubocop-performance', '~> 1.11'
  gem 'rubocop-rails', '~> 2.11'
  gem 'spring', '~> 4.0'
  gem 'web-console', '~> 4.1.0'
end

group :test do
  gem 'capybara', '~> 3.26'
  gem 'codecov', '~> 0.6'
  gem 'minitest-rails', '~> 7.0'
  gem 'minitest-reporters', '~> 1.4'
  gem 'selenium-webdriver', '~> 3.142'
  gem 'simplecov', '~> 0.21'
end

group :production do
  gem 'dotenv-rails', '~> 2.7'
  gem 'rack-timeout', '~> 0.6'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

# Use Redis for Action Cable
gem "redis", "~> 4.0"
