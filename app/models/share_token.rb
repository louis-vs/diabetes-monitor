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

# Stores a token which allows someone without an account to view (but not edit) your
# data. An opt-in feature which may be useful if you need to share information e.g.
# with your doctor.
class ShareToken < ApplicationRecord
  # @!attribute [rw] token
  #   @return [ActiveRecord::Relation] the user directly associated with this token
  belongs_to :user
  # @!attribute [rw] token
  #   @return [String] a unique token
  has_secure_token length: 36
  # @!attribute [rw] uses_remaining
  #   @return [Integer] the number of uses before the token deletes itself

  after_commit :destroy_if_no_uses_remaining, if: :persisted?

  private

  def destroy_if_no_uses_remaining
    return if uses_remaining.positive?

    destroy!
  end
end
