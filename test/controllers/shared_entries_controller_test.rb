# frozen_string_literal: true

require 'test_helper'

class SharedEntriesControllerTest < ActionDispatch::IntegrationTest
  test 'should get index with valid token' do
    get shared_entries_url, params: { token: share_tokens(:marcus_token_one).token }
    assert_response :success
  end

  test 'should not get index with no token' do
    get shared_entries_url
    assert_redirected_to root_path
  end

  test 'should not get index with invalid token' do
    get shared_entries_url, params: { token: 'invalidtoken' }
    assert_redirected_to root_path
  end
end
