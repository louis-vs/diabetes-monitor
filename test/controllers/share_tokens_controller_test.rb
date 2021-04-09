# frozen_string_literal: true

require 'test_helper'

class ShareTokensControllerTest < ActionDispatch::IntegrationTest
  setup do
    authenticate
    @share_token = share_tokens(:marcus_token_one)
    @foreign_share_token = share_tokens(:user_1_token_1) # rubocop:disable Naming/VariableNumber
    @share_token_params = { user_id: users(:juliet).id, token: '123456', uses_remaining: 7 }
  end

  test 'should get index' do
    get share_tokens_url
    assert_response :success
  end

  test 'should not get index if not authenticated' do
    deauthenticate
    get share_tokens_url
    assert_redirected_to new_user_session_path
  end

  test 'should create share_token' do
    assert_difference('ShareToken.count') do
      post share_tokens_url, xhr: true
    end

    assert_response :success
  end

  test 'creating share_token should ignore user_id' do
    assert_difference('ShareToken.count') do
      post share_tokens_url, xhr: true, params: { share_token: @share_token_params }
    end
    assert_response :success

    assert_empty users(:juliet).share_tokens
  end

  test 'should not create share_token if not authenticated' do
    deauthenticate
    assert_no_difference 'ShareToken.count' do
      post share_tokens_url, xhr: true
    end

    assert_response :unauthorized
  end

  test 'should update share_token remaining uses' do
    patch share_token_url(@share_token), xhr: true
    assert_response :success

    @share_token.reload
    assert_equal 5, @share_token.uses_remaining
    assert_equal @user.id, @share_token.user.id
  end

  test 'should only update share_tokens of authenticated user' do
    patch share_token_url(@foreign_share_token), xhr: true
    assert_response :unauthorized

    @foreign_share_token.reload
    assert_not_equal 5, @foreign_share_token.uses_remaining
    assert_not_equal @user.id, @foreign_share_token.user.id
  end

  test 'updating share_token should ignore parameters' do
    patch share_token_url(@share_token), xhr: true, params: { share_token: @share_token_params }
    assert_response :success

    @share_token.reload
    assert_equal 5, @share_token.uses_remaining
    assert_equal @user.id, @share_token.user.id
    assert_empty users(:juliet).share_tokens
  end

  test 'should not update share_token if not authenticated' do
    deauthenticate
    assert_no_changes -> { @share_token.uses_remaining } do
      patch share_token_url(@share_token), xhr: true
    end

    assert_response :unauthorized
  end

  test 'should destroy share_token' do
    assert_difference('ShareToken.count', -1) do
      delete share_token_url(@share_token), xhr: true
    end

    assert_response :success
  end

  test 'should only destroy share_token of authenticated user' do
    assert_no_difference('ShareToken.count') do
      delete share_token_url(@foreign_share_token), xhr: true
    end

    assert_response :unauthorized
  end

  test 'should not destroy share_token if not authenticated' do
    deauthenticate
    assert_no_difference 'ShareToken.count' do
      post share_tokens_url, xhr: true, params: { share_token: @new_share_token_params }
    end

    assert_response :unauthorized
  end
end
