# frozen_string_literal: true

require 'test_helper'

# fixes GitHub CI
require 'selenium-webdriver' unless self.class.const_defined? :Selenium

ActiveSupport.on_load :action_dispatch_system_test_case do
  ActionDispatch::SystemTesting::Server.silence_puma = true
end

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :selenium, using: :headless_chrome, screen_size: [1400, 800]
end
