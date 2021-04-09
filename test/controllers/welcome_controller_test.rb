# frozen_string_literal: true

require 'test_helper'

class WelcomeControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get root_url
    assert_response :success
  end

  test 'should get about' do
    get about_url
    assert_response :success
  end

  test 'should get index when authenticated' do
    authenticate
    get root_url
    assert_response :success
  end

  test 'should get about when authenticated' do
    authenticate
    get about_url
    assert_response :success
  end
end
