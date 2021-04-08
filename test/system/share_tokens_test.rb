# frozen_string_literal: true

require 'application_system_test_case'

class ShareTokensTest < ApplicationSystemTestCase
  setup do
    @share_token = share_tokens(:one)
  end

  test 'visiting the index' do
    visit share_tokens_url
    assert_selector 'h1', text: 'Share Tokens'
  end

  test 'creating a Share token' do
    visit share_tokens_url
    click_on 'New Share Token'

    fill_in 'Token', with: @share_token.token
    fill_in 'User', with: @share_token.user_id
    fill_in 'Uses remaining', with: @share_token.uses_remaining
    click_on 'Create Share token'

    assert_text 'Share token was successfully created'
    click_on 'Back'
  end

  test 'updating a Share token' do
    visit share_tokens_url
    click_on 'Edit', match: :first

    fill_in 'Token', with: @share_token.token
    fill_in 'User', with: @share_token.user_id
    fill_in 'Uses remaining', with: @share_token.uses_remaining
    click_on 'Update Share token'

    assert_text 'Share token was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Share token' do
    visit share_tokens_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Share token was successfully destroyed'
  end
end
