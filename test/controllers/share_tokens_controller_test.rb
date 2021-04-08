# frozen_string_literal: true

require 'test_helper'

class ShareTokensControllerTest < ActionDispatch::IntegrationTest
  setup do
    @share_token = share_tokens(:one)
    @user = users(:marcus)
    @user.confirm
    sign_in @user
  end

  test 'should get index' do
    get share_tokens_url
    assert_response :success
  end

  test 'should create share_token' do
    assert_difference('ShareToken.count') do
      post share_tokens_url, xhr: true
      assert_response :success
    end
  end

  test 'should update share_token' do
    patch share_token_url(@share_token), xhr: true
    assert_response :success
  end

  test 'should destroy share_token' do
    assert_difference('ShareToken.count', -1) do
      delete share_token_url(@share_token), xhr: true
    end

    assert_response :success
  end
end
