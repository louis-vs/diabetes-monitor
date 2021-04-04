# frozen_string_literal: true

# Stores an entry into the blood sugar logbook.
#
# An Entry contains two readings, one for the current blood sugar and one for the amount of insulin
# taken. Both must be positive, the former must be greater than zero, since otherwise you would be dead.
# An Entry also contains a tag (morning/lunch/dinner/night/other).
class Entry < ApplicationRecord
  # @!attribute [rw] user
  #   @return [ActiveRecord::Relation] the user to whom this entry is associated
  belongs_to :user

  # @!attribute [rw] time
  #   @return [DateTime] the time at which the readings were taken
  # @!attribute [rw] blood_sugar
  #   @return [BigDecimal] the blood sugar reading associated with this entry
  # @!attribute [rw] insulin
  #   @return [BigDecimal] the amount of insulin taken at {#time}.
  # @!attribute [rw] notes
  #   @return [String] custom user notes
  # @!attribute [rw] tag
  #   @return [Integer]

  enum tag: { other: 0, morning: 1, lunch: 2, dinner: 3, night: 4 }

  scope :sorted, -> { order(time: :asc) }

  validates :time, presence: true
  validates :blood_sugar, numericality: { greater_than_or_equal_to: 0 }
  validates :insulin, numericality: { greater_than_or_equal_to: 0 }
end
