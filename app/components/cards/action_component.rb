# frozen_string_literal: true

module Cards
  class ActionComponent < ApplicationComponent
    delegate :bs_icon, to: :helpers

    def initialize(path:, name: '', method: :get, params: {}, confirm_message: '', button_type: 'primary', icon: '', classes: '')
      @name = name
      @path = path
      @method = method
      @params = params
      @confirm_message = confirm_message
      @button_type = button_type
      @icon = icon
      @classes = classes
    end

    private

    def form_data_attribute
      return if @confirm_message.blank?

      { data: { turbo_confirm: @confirm_message } }
    end
  end
end
