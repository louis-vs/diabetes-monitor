# frozen_string_literal: true

module Cards
  class ActionGroupComponent < ApplicationComponent
    renders_many :actions, Cards::ActionComponent
    renders_many :secondary_actions, Cards::ActionComponent
  end
end
