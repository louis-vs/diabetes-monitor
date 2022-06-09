# frozen_string_literal: true

module DateHelper
  DATE_PARAM_FORMAT = '%Y%m%d'

  def param_to_date(param)
    Date.strptime param, DATE_PARAM_FORMAT
  rescue Date::Error
    nil
  end

  def date_to_param(date)
    return unless date

    date.strftime DATE_PARAM_FORMAT
  end

  def today?(date)
    date == Time.zone.today
  end
end
