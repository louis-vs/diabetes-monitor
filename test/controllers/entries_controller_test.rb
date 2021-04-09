# frozen_string_literal: true

require 'test_helper'

class EntriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    authenticate
    @entry = entries(:marcus_entry_one)
    @new_entry_params = { blood_sugar: 1,
                          insulin: 1,
                          time: Time.current,
                          tag: 'other' }
  end

  test 'should get index' do
    get entries_url
    assert_response :success
  end

  test 'should not get index if not authenticated' do
    deauthenticate
    get entries_url
    assert_redirected_to new_user_session_path
  end

  test 'should create entry' do
    assert_difference 'Entry.count' do
      post entries_url, xhr: true, params: { entry: @new_entry_params }
    end

    assert_response :success
  end

  test 'created entry should reference authenticated user' do
    assert_difference -> { @user.entries.count } do
      post entries_url, xhr: true, params: { entry: @new_entry_params }
    end

    assert_response :success
  end

  test 'create should ignore user parameter' do
    assert_difference -> { @user.entries.count } do
      post entries_url, xhr: true, params: { entry: @new_entry_params.merge(user_id: users(:juliet).id) }
    end

    assert_empty users(:juliet).entries
    assert_response :success
  end

  test 'should not create entry if not authenticated' do
    deauthenticate
    assert_no_difference 'Entry.count' do
      post entries_url, xhr: true, params: { entry: @new_entry_params }
    end

    assert_response :unauthorized
  end

  test 'should destroy entry' do
    assert_difference 'Entry.count', -1 do
      delete entry_url(@entry), xhr: true
    end
  end

  test 'should not destroy entry if not authenticated' do
    deauthenticate
    assert_no_difference 'Entry.count' do
      post entries_url, xhr: true, params: { entry: @new_entry_params }
    end

    assert_response :unauthorized
  end
end
