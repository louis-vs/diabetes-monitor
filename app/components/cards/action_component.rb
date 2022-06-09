# frozen_string_literal: true

module Cards
  class ActionComponent < ApplicationComponent
    delegate :bs_icon, to: :helpers

    def initialize(path:, name: '', method: :get, params: {}, button_type: 'primary', icon: '', classes: '')
      @name = name
      @path = path
      @method = method
      @params = params
      @button_type = button_type
      @icon = icon
      @classes = classes
    end
  end
end
