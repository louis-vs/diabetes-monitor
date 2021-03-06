# frozen_string_literal: true

# CodeCov integration
if ENV['CI']
  require 'simplecov'
  require 'codecov'
  SimpleCov.formatter = SimpleCov::Formatter::Codecov

  SimpleCov.start 'rails' do
    enable_coverage :branch
  end
end

require 'minitest/mock'
require 'minitest/reporters'
Minitest::Reporters.use!

# Cofnigure Rails environment
ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

# Filter out the backtrace from minitest while preserving the one from other libraries.
Minitest.backtrace_filter = Minitest::BacktraceFilter.new

# require helpers
require 'helpers/test_password_helper'

# include helpers in fixtures
ActiveRecord::FixtureSet.context_class.send :include, TestPasswordHelper

module ActiveSupport
  class TestCase
    # Run tests in parallel with specified workers
    parallelize workers: :number_of_processors
    # SimpleCov integration
    parallelize_setup do |worker|
      SimpleCov.command_name "#{SimpleCov.command_name} worker #{worker}"
    end
    parallelize_teardown do
      SimpleCov.result
    end

    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    fixtures :all

    # Add more helper methods to be used by all tests here...
    include Devise::Test::IntegrationHelpers
    include TestPasswordHelper

    def authenticate
      @user = users(:marcus)
      @user.confirm
      sign_in @user
    end

    def deauthenticate
      @user && sign_out(@user)
    end
  end
end
