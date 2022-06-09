# frozen_string_literal: true

class AlertComponent < ApplicationComponent
  def initialize(type:, text:)
    @type = type
    @text = text
  end
end
