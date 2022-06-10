# frozen_string_literal: true

class Entries::SummaryComponent < ApplicationComponent
  def initialize(entry:)
    @entry = entry
  end
end
