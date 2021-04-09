# frozen_string_literal: true

require 'test_helper'

class EntriesControllerTest < ActionDispatch::IntegrationTest # rubocop:disable Metrics/ClassLength
  setup do
    authenticate
    @entry = entries(:marcus_entry_one)
    @foreign_entry = entries(:user_1_entry_1) # rubocop:disable Naming/VariableNumber
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

  test 'should get edit' do
    get edit_entry_url(@entry)
    assert_response :success
  end

  test 'should only get edit for entry of current user' do
    get edit_entry_url(@foreign_entry)
    assert_response :forbidden
  end

  test 'should not get edit if not authenticated' do
    deauthenticate
    get edit_entry_url(@entry)
    assert_redirected_to new_user_session_path
  end

  test 'should update entry using local form' do
    patch entry_url(@entry), xhr: false, params: { entry: @new_entry_params }
    assert_redirected_to entries_path
  end

  test 'should only update entry of current user using local form' do
    patch entry_url(@foreign_entry), xhr: false, params: { entry: @new_entry_params }
    assert_response :forbidden
  end

  test 'should not update entry using local form if not authenticated' do
    deauthenticate
    patch entry_url(@entry), xhr: false, params: { entry: @new_entry_params }
    assert_redirected_to new_user_session_path
  end

  test 'should update entry using remote form' do
    patch entry_url(@entry), xhr: true, params: { entry: @new_entry_params }
    assert_response :success
  end

  test 'should only update entry of current user using remote form' do
    patch entry_url(@foreign_entry), xhr: true, params: { entry: @new_entry_params }
    assert_response :forbidden
  end

  test 'should not update entry using remote form if not authenticated' do
    deauthenticate
    patch entry_url(@entry), xhr: true, params: { entry: @new_entry_params }
    assert_response :unauthorized
  end

  test 'should destroy entry' do
    assert_difference 'Entry.count', -1 do
      delete entry_url(@entry), xhr: true
    end

    assert_response :success
  end

  test 'should only destroy entry of authenticated user' do
    assert_no_difference 'Entry.count' do
      delete entry_url(@foreign_entry), xhr: true
    end
    assert_response :forbidden

    @foreign_entry.reload
    assert_not_nil @foreign_entry
    assert_not @foreign_entry.destroyed?
    assert_not_equal @user.id, @foreign_entry.user.id
  end

  test 'should not destroy entry if not authenticated' do
    deauthenticate
    assert_no_difference 'Entry.count' do
      post entries_url, xhr: true, params: { entry: @new_entry_params }
    end

    assert_response :unauthorized
  end
end
