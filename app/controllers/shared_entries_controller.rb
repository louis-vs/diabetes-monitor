# frozen_string_literal: true

#--
# Copyright 2021 Louis Van Steene
#
# This file is part of diabetes-monitor.
#
# diabetes-monitor is free software: you can redistribute it and/or modify
# it under the terms of version 3 of the GNU General Public License as published by
# the Free Software Foundation.
#
# diabetes-monitor is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with diabetes-monitor.  If not, see <https://www.gnu.org/licenses/>.
#++

# Controller which allows anyone with a {ShareToken} to view a particular users entries,
# but not to edit them.
class SharedEntriesController < ApplicationController
  before_action :authenticate_share_token

  def index
    @entries = Entry.where(user_id: @user.id)
    # expose @data array of entries grouped by date for table { date: [objects] }
    @data = @entries.sorted.group_by { |entry| entry.time.to_date }
    @data[Time.zone.today.to_date] ||= []
  end

  private

  def redirect_with_error
    redirect_to root_path, alert: 'Access denied. Your shared link may have expired.'
  end

  def authenticate_share_token
    (redirect_with_error and return) if params[:token].nil?

    @share_token = ShareToken.find_by(token: params[:token])
    if @share_token.nil?
      redirect_with_error
    else
      @user = @share_token.user
      @share_token.decrement(:uses_remaining)
      @share_token.save!
    end
  end
end
