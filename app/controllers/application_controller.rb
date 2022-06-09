# frozen_string_literal: true

#--
# Copyright 2021 Louis Van Steene
#
# This file is part of diabetes-monitor.
#
# diabetes-monitor is free software: you can redistribute it and/or modify
# it under the terms of version 3 of the GNU Affero General Public License as
# published by the Free Software Foundation.
#
# diabetes-monitor is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
# or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU Affero General Public
# License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with diabetes-monitor.  If not, see <https://www.gnu.org/licenses/>.
#++

# Controller base class
class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  around_action :switch_locale

  add_flash_types :success, :warning, :danger, :info

  def default_url_options
    { locale: (I18n.locale unless I18n.locale == I18n.default_locale) }
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name terms_of_service])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end

  def switch_locale(&)
    locale = params[:locale] || I18n.default_locale
    I18n.with_locale(locale, &)
  end

  def not_found!
    raise ActionController::RoutingError, 'Not Found'
  end
end
