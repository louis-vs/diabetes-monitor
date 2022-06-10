# frozen_string_literal: true

module Entries
  class SummaryComponent < ApplicationComponent
    def initialize(entry:)
      @entry = entry
    end
  end
end
