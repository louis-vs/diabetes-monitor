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

# Controller for {Entry} records.
class EntriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_entry, only: %i[edit update destroy]
  before_action :check_user, only: %i[edit update destroy]

  # GET /entries
  def index
    @entries = Entry.where(user_id: current_user.id)
    # expose @data array of entries grouped by date for table { date: [objects] }
    @data = @entries.sorted.group_by { |entry| entry.time.to_date }
    @data[Time.zone.today.to_date] ||= []
  end

  # GET /entries/1/edit
  def edit; end

  # POST /entries
  def create
    @entries = Entry.where(user_id: current_user.id)
    @entry = Entry.new(entry_params)
    # enfore correct user
    @entry.user = current_user
    @entry.save
  end

  # PATCH/PUT /entries/1
  def update
    if @entry.update(entry_params)
      redirect_to @entry, notice: 'Entry was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /entries/1
  def destroy
    @entry.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_entry
    @entry = Entry.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def entry_params
    params.require(:entry).permit(:time, :blood_sugar, :insulin, :tag, :notes)
  end

  # Repond with 401 error if the user attempts to manipulate another user's entries
  def check_user
    head :unauthorized unless current_user.id == @entry.user_id
  end
end
