# frozen_string_literal: true

require 'test_helper'

class EntryTest < ActiveSupport::TestCase
  setup do
    @entry = entries(:marcus_entry_one)
    @new_entry = Entry.new
  end

  test 'has associated user' do
    assert_not_nil @entry.user
    assert_nil @new_entry.user
  end

  test 'has associated time' do
    assert_not_nil @entry.time
    assert_nil @new_entry.time
  end

  test 'has associated blood sugar' do
    assert_not_nil @entry.blood_sugar
    assert_equal 0.0, @new_entry.blood_sugar
  end

  test 'has associated insulin' do
    assert_not_nil @entry.insulin
    assert_equal 0.0, @new_entry.insulin
  end

  test 'has associated notes' do
    assert_not_nil @entry.notes
    assert_equal '', @new_entry.notes
  end

  test 'has associated tag' do
    assert_not_nil @entry.tag
    assert_equal 'other', @new_entry.tag
  end

  test 'user must not be empty' do
    assert @entry.valid?
    assert_empty @entry.errors[:user]
    @entry.user = nil
    assert @entry.invalid?
    assert_not_empty @entry.errors[:user]
  end

  test 'time must not be empty' do
    assert @entry.valid?
    assert_empty @entry.errors[:time]
    @entry.time = nil
    assert @entry.invalid?
    assert_not_empty @entry.errors[:time]
  end

  test 'blood sugar must be positive' do
    assert @entry.valid?
    assert_empty @entry.errors[:blood_sugar]
    @entry.blood_sugar = -1
    assert @entry.invalid?
    assert_not_empty @entry.errors[:blood_sugar]
  end

  test 'insulin must be positive' do
    assert @entry.valid?
    assert_empty @entry.errors[:insulin]
    @entry.insulin = -1
    assert @entry.invalid?
    assert_not_empty @entry.errors[:insulin]
  end

  test 'sorted in time order' do
    @entries = Entry.all.sorted
    assert(@entries.each_cons(2).all? { |i, j| i.time < j.time })
  end
end
