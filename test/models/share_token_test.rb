# frozen_string_literal: true

require 'test_helper'

class ShareTokenTest < ActiveSupport::TestCase
  setup do
    @share_token = share_tokens(:marcus_token_one)
    @new_share_token = ShareToken.new
  end

  test 'has associated user' do
    assert_not_nil @share_token.user
    assert_nil @new_share_token.user
  end

  test 'has associated uses remaining' do
    assert_not_nil @share_token.uses_remaining
    assert_equal 0, @new_share_token.uses_remaining
  end

  test 'new share token generates token when created' do
    assert_not @new_share_token.persisted?
    assert_difference 'ShareToken.count', 1 do
      @new_share_token.user = User.first
      @new_share_token.uses_remaining = 1
      @new_share_token.save
    end
    assert @new_share_token.persisted?
    assert_not_empty @new_share_token.token
  end

  test 'tokens must be unique' do
    assert_not @new_share_token.persisted?
    @new_share_token.user = User.first
    @new_share_token.uses_remaining = 5
    @new_share_token.token = @share_token.token
    assert_raises ActiveRecord::RecordNotUnique do
      @new_share_token.save
    end
    assert_not @new_share_token.persisted?
  end

  test 'destroys self if uses remaining is not positive' do
    assert_difference 'ShareToken.count', -1 do
      @share_token.update(uses_remaining: 0)
    end
    assert @share_token.destroyed?
  end
end
