# frozen_string_literal: true

module BootstrapHelper
  def bs_icon(name, classes: '', html_options: {})
    tag.i class: "bi-#{name} #{classes}", **html_options
  end
end
