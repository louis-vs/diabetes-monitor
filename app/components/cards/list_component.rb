# frozen_string_literal: true

module Cards
  class ListComponent < ApplicationComponent
    renders_many :items
  end
end
