# frozen_string_literal: true

require 'test_helper'

# fixes GitHub CI
require 'selenium-webdriver' unless self.class.const_defined? :Selenium

ActiveSupport.on_load :action_dispatch_system_test_case do
  ActionDispatch::SystemTesting::Server.silence_puma = true
end

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  include TestPasswordHelper

  driven_by :selenium, using: :headless_chrome, screen_size: [1400, 800]

  def authenticate
    @user = users(:marcus)
    visit new_user_session_path
    within '.login-fields' do
      fill_in 'email', with: @user.email
      fill_in 'password', with: default_password
    end
    click_on 'Log in'
  end
end
