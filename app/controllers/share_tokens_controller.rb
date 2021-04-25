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

# Controller for {ShareToken} records.
# Requries authentication.
class ShareTokensController < ApplicationController
  before_action :authenticate_user!
  before_action :set_share_token, only: %i[update destroy]
  before_action :check_user, only: %i[update destroy]

  MAX_TOKEN_USES = 10

  # GET /share_tokens
  def index
    @share_tokens = current_user.share_tokens
  end

  # POST /share_tokens
  def create
    @share_token = ShareToken.new
    @share_token.user = current_user
    @share_token.uses_remaining = MAX_TOKEN_USES

    @share_token.save
  end

  # PATCH/PUT /share_tokens/1
  # Currently does not use parameters, instead just resets remaining uses.
  def update
    @share_token.update(uses_remaining: MAX_TOKEN_USES)
  end

  # DELETE /share_tokens/1
  def destroy
    @share_token.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_share_token
    @share_token = ShareToken.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def share_token_params
    params.require(:share_token).permit(:uses_remaining)
  end

  # Repond with 401 error if the user attempts to manipulate another user's entries
  def check_user
    head :forbidden unless current_user.id == @share_token.user_id
  end
end
