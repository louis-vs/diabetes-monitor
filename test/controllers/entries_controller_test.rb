# frozen_string_literal: true

require 'test_helper'

class EntriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @entry = entries(:one)
    sign_in users(:marcus)
  end

  test 'should get index' do
    get entries_url
    assert_response :success
  end

  test 'should create entry' do
    assert_difference('Entry.count') do
      post entries_url, xhr: true,
                        params: { entry: { blood_sugar: @entry.blood_sugar,
                                           insulin: @entry.insulin,
                                           time: @entry.time,
                                           tag: @entry.tag,
                                           user_id: @entry.user_id } }
    end

    assert_response :success
  end

  test 'should destroy entry' do
    assert_difference('Entry.count', -1) do
      delete entry_url(@entry), xhr: true
    end
  end
end
