# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @user = users(:marcus)
    @new_user = User.new
  end

  test 'has associated entries' do
    assert_not_nil @user.entries
    assert @new_user.entries.empty?
  end

  test 'has associated name' do
    assert_not_nil @user.name
    assert_nil @new_user.name
  end

  test 'has associated email' do
    assert_not_nil @user.email
    assert_equal '', @new_user.email
  end

  test 'destroys associated entries' do
    assert_difference 'Entry.count', -1 * @user.entries.count do
      @user.destroy
    end
    assert_empty @user.errors[:base]
  end

  test 'destroys associated share tokens' do
    assert_difference 'ShareToken.count', -1 * @user.share_tokens.count do
      @user.destroy
    end
    assert_empty @user.errors[:base]
  end
end
