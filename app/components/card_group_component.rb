# frozen_string_literal: true

class CardGroupComponent < ApplicationComponent
  renders_many :cards
  renders_one :last_card

  def initialize(id: '')
    @id = id
  end
end
