# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.3'

gem 'bootsnap', '~> 1.7.6', require: false
gem 'devise'
gem 'haml-rails', '~> 2.0'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.4'
gem 'rails', '~> 6.1.4'
gem 'rails-i18n', '~> 6.0'
gem 'sass-rails', '~> 6'
gem 'webpacker', '~> 5.4'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
end

group :development do
  gem 'listen', '~> 3.6'
  # gem 'rack-mini-profiler', '~> 2.0'
  gem 'rubocop', '~> 1.28'
  gem 'rubocop-performance', '~> 1.11'
  gem 'rubocop-rails', '~> 2.11'
  gem 'spring'
  gem 'web-console', '~> 4.1.0'
end

group :test do
  gem 'capybara', '~> 3.26'
  gem 'codecov', '~> 0.6'
  gem 'minitest-rails', '~> 6.1'
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
