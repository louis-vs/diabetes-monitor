# frozen_string_literal: true

begin
  require 'rubocop/rake_task'

  RuboCop::RakeTask.new do |t|
    t.options << '--parallel' if ENV['CI']
  end
rescue LoadError # rubocop:disable Lint/SuppressedException
end
