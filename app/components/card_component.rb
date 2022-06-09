# frozen_string_literal: true

class CardComponent < ApplicationComponent
  renders_one :header, Cards::HeaderComponent
  renders_one :action_group, Cards::ActionGroupComponent
  renders_one :subcards, CardGroupComponent
  renders_one :entries_form, Entries::FormComponent
end
