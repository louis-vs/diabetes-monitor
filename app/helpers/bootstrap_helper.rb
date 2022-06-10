# frozen_string_literal: true

module BootstrapHelper
  def bs_icon(name, classes: '', html_options: {})
    tag.i class: "bi-#{name} #{classes}", **html_options
  end

  def bs_badge(text, colour: 'primary', classes: '')
    tag.span text, class: "badge bg-#{colour} #{classes}"
  end
end
