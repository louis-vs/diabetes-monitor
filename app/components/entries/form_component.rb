# frozen_string_literal: true

module Entries
  class FormComponent < ApplicationComponent
    def initialize(entry:)
      @entry = entry
    end

    private

    def delete_button
      if @entry.new_record?
        tag.a helpers.bs_icon('trash'),
              href: blank_new_entry_path(date: helpers.date_to_param(@entry.time)),
              class: 'btn btn-danger'
      else
        render Cards::ActionComponent.new(icon: 'trash-fill', path: entry_path(@entry),
                                          method: :delete, confirm_message: 'Are you sure?',
                                          button_type: 'danger')
      end
    end

    def cancel_button
      tag.a 'Cancel', href: entry_path(@entry), class: 'btn btn-warning' unless @entry.new_record?
    end
  end
end
