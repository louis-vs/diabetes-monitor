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

# Controller for {Entry} records.
class EntriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_entry, only: %i[show edit update destroy]
  before_action :check_user, only: %i[show edit update destroy]

  # GET /entries
  def index
    @date_totals = Entry.for_user(current_user).sorted.group_by_date.count.map do |date_total|
      [date_total.first.to_date, date_total.second]
    end
    @date_totals.prepend [Time.zone.today, 0] unless @date_totals.first.first == Time.zone.today
  end

  # GET /entries/day/20220101
  def show_day
    set_date || not_found!
    set_date_entries

    render layout: false
  end

  def show; end

  def blank
    set_date
  end

  def new
    set_date # || @date = Time.zone.now
    @entry = Entry.new(user: current_user, time: @date)
  end

  # POST /entries
  def create
    @entries = Entry.where(user_id: current_user.id)
    @entry = Entry.new(entry_params)
    # enfore correct user
    @entry.user = current_user
    @entry.save
    flash.now[:success] = t('.success')
  end

  # GET /entries/1/edit
  def edit; end

  # PATCH/PUT /entries/1
  def update
    # respond_to do |format|
    #   if @entry.update(entry_params)
    #     format.html { redirect_to entry_path(@entry), notice: t('.success') }
    #   else
    #     format.html { render :edit }
    #   end
    # end
    if @entry.update(entry_params)
      flash.now[:success] = t('.success')
    else
      # TODO: do something
    end
  end

  # DELETE /entries/1
  def destroy
    @entry.destroy
    flash.now[:success] = t('.success')
  end

  private

  def set_entry
    @entry = Entry.for_user(current_user).find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def entry_params
    params.require(:entry).permit(:time, :blood_sugar, :insulin, :tag, :notes)
  end

  # Repond with 401 error if the user attempts to manipulate another user's entries
  def check_user
    head :forbidden unless current_user.id == @entry.user_id
  end

  # Sets date (nil if invalid format)
  def set_date
    return nil unless /\d{8}/.match?(params[:date])

    @date = helpers.param_to_date params[:date]
  end

  # Sets entries
  def set_date_entries
    @entries = Entry.for_user(current_user).find_by(date: @date)
  end
end
