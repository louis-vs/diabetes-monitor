# frozen_string_literal: true

module TurboHelper
  def lazy_turbo_frame_tag(ids, src: nil, target: nil, **attributes)
    attributes[:loading] = 'lazy'
    turbo_frame_tag ids, src: src, target: target, **attributes do
      spinner_tag
    end
  end

  def spinner_tag(id: '', hidden: false)
    tag.div id: id, class: "spinner-border#{hidden ? ' d-none' : ''}", role: 'status' do
      tag.span 'Loading...', class: 'visually-hidden' # TODO: translation
    end
  end

  def hidden_spinner_tag(id: '')
    spinner_tag(id:, hidden: true)
  end

  def card_id(date)
    "card_#{date_to_param(date)}"
  end

  def card_entries_id(date)
    "#{card_id(date)}__entries"
  end

  def card_entry_id(date, entry)
    "#{card_entries_id(date)}_#{entry.id}"
  end

  def card_new_entry_id(date)
    return 'card_new__entry_new' unless date

    "card_#{date_to_param(date)}__entry_new"
  end

  def card_entry_form_id(entry)
    if entry.new_record?
      "#{card_new_entry_id(entry.time)}__form"
    else
      "#{card_entry_id(entry.time, entry)}__form"
    end
  end
end
