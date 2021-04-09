# frozen_string_literal: true

require 'test_helper'

class SharedEntriesControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get shared_entries_url, params: { token: share_tokens(:marcus_token_one).token }
    assert_response :success
  end
end
