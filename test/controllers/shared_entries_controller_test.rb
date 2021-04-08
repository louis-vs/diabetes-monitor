# frozen_string_literal: true

require 'test_helper'

class SharedEntriesControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get shared_entries_url, params: { token: share_tokens(:one).token }
    assert_response :success
  end
end
