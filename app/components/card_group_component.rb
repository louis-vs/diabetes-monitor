# frozen_string_literal: true

class CardGroupComponent < ApplicationComponent
  renders_many :cards
  renders_one :last_card

  def initialize(id: '', responsive: true)
    @id = id
    @responsive = responsive
  end

  def responsive?
    @responsive
  end
end
