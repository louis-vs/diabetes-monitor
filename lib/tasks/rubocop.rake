# frozen_string_literal: true

require 'rubocop/rake_task'

RuboCop::RakeTask.new do |t|
  t.options << '--parallel' if ENV['CI']
end
