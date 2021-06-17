# frozen_string_literal: true

require 'application_system_test_case'

class ShareTokensTest < ApplicationSystemTestCase
  setup do
    @share_token = share_tokens(:marcus_token_one)
    authenticate
  end

  test 'visiting the index' do
    visit share_tokens_url
    assert_selector 'h1', text: 'Share Links'
  end

  test 'creating a Share token' do
    visit share_tokens_url
    click_on 'Generate token'

    assert_text 'Successfully added new token'
  end

  test 'reset a Share token' do
    visit share_tokens_url
    click_on 'Reset remaining uses', match: :first

    assert_text 'Successfully updated token'
  end

  test 'destroying a Share token' do
    visit share_tokens_url
    click_on 'Delete token', match: :first

    assert_text 'Destroyed token'
  end
end
