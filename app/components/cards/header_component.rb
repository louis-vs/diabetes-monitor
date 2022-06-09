# frozen_string_literal: true

module Cards
  class HeaderComponent < ApplicationComponent
    renders_one :title, 'HeaderTitleComponent'
    renders_one :description

    class HeaderTitleComponent < ApplicationComponent
      def initialize(title:, tag: :h2, subtitle: '', classes: '', subtitle_colour: 'secondary')
        @title = title
        @tag = tag
        @subtitle = subtitle
        @classes = "#{classes} card-title"
        @subtitle_colour = subtitle_colour
      end

      def call
        content_tag @tag, class: @classes do
          subtitle? ? (@title + tag.span(@subtitle, class: "badge bg-#{@subtitle_colour} ms-2")).html_safe : @title
        end
      end

      private

      def subtitle?
        @subtitle.present?
      end
    end
  end
end
