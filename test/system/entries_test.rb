# frozen_string_literal: true

require 'application_system_test_case'

class EntriesTest < ApplicationSystemTestCase
  setup do
    @entry = entries(:marcus_entry_one)
    authenticate
  end

  test 'visiting the index' do
    visit entries_url
    assert_selector 'h1', text: 'Log entries'
  end

  test 'creating an Entry' do
    visit entries_url
    click_on 'Expand', match: :first
    click_on 'New entry', match: :first

    fill_in 'Blood Sugar', with: @entry.blood_sugar
    fill_in 'Insulin', with: @entry.insulin
    select 'Morning', from: 'Tag'
    fill_in 'Notes', with: @entry.notes
    click_on 'Save'

    assert_text 'Successfully added new entry'
  end

  test 'updating an Entry' do
    visit entries_url
    within "#row_#{@entry.time.to_formatted_s(:number)[0..7]}" do
      click_on 'Expand', match: :first
    end
    click_on 'Edit', match: :first

    fill_in 'Blood Sugar', with: @entry.blood_sugar
    fill_in 'Insulin', with: @entry.insulin
    select 'Morning', from: 'Tag'
    fill_in 'Notes', with: @entry.notes
    click_on 'Save'

    assert_text 'Entry was successfully updated'
  end

  test 'destroying an Entry' do
    visit entries_url
    within "#row_#{@entry.time.to_formatted_s(:number)[0..7]}" do
      click_on 'Expand', match: :first
    end
    page.accept_confirm do
      click_on 'Delete', match: :first
    end

    assert_text 'Destroyed entry'
  end
end
