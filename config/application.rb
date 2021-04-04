# frozen_string_literal: true

#--
# Copyright 2021 Louis Van Steene
#
# This file is part of diabetes-monitor.
#
# diabetes-monitor is free software: you can redistribute it and/or modify
# it under the terms of version 3 of the GNU General Public License as published by
# the Free Software Foundation.
#
# diabetes-monitor is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with diabetes-monitor.  If not, see <https://www.gnu.org/licenses/>.
#++

require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module DiabetesMonitor
  # The Diabetes Monitor app
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    # don't embed auth tokens in AJAX forms
    config.action_view.embed_authenticity_token_in_remote_forms = false

    ActionView::Base.field_error_proc = proc do |html_tag, _instance|
      html_tag.gsub('form-control', 'form-control is-invalid').html_safe # rubocop:disable Rails/OutputSafety
    end
  end
end
